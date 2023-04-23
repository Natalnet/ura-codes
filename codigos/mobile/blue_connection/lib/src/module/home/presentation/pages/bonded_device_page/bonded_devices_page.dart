import 'dart:async';

import 'package:blue_connection/config/bluetooth_config/enum/bluetooth_status.dart';
import 'package:blue_connection/src/module/control/control_page/control_page.dart';
import 'package:blue_connection/src/module/shared/domain/entities/blue_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/loading_modal.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';

class BondedDevicePage extends StatefulWidget {
  const BondedDevicePage({super.key});

  @override
  State<BondedDevicePage> createState() => _BondedState();
}

class _BondedState extends State<BondedDevicePage> {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();
  late StreamSubscription _subscription;
  Device device = Device();
  @override
  void initState() {
    _subscription = homeBloc.stream.listen(_stateListener);
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.add(HomeEvent.requestBluetoothDispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 10,
        title: Text(
          'Dispositivos Proximos',
          style: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return homeBloc.bondedDevices.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Conecte com dispositivos próximos disponíveis',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            homeBloc.bondedDevices.length,
                            (index) {
                              device = homeBloc.bondedDevices[index];
                              return ListTile(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                ),
                                leading: Icon(
                                  Icons.bluetooth_audio,
                                  color: Colors.blue[900],
                                  size: 35,
                                ),
                                title: Text(
                                  device.name,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.blue[900],
                                ),
                                onTap: () {
                                  homeBloc.add(
                                    HomeEvent.requestConnectDevice(
                                      device: device,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bluetooth_disabled_rounded,
                        size: 100,
                        color: Colors.indigo[900],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nenhum Dispositivo Encontrado',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.indigo[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.indigo[900],
                          ),
                        ),
                        onPressed: () {
                          if (mounted) {
                            if (homeBloc
                                .bluetoothController.bluetoothStatus.enabled) {
                              homeBloc.add(HomeEvent.requestBondedDevices());
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Pesquisar Novamente',
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  _stateListener(HomeState state) => state.maybeWhen(
        loading: () {
          if (mounted) {
            showModalBottomSheet(
              context: context,
              builder: (context) => const LoadingModal(),
              isDismissible: false,
            );
          }
        },
        sucessBondedDevices: () => Modular.to.pop(),
        sucessDeviceConnected: () {
          if (mounted) {
            Modular.to.pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Dispositivo Conectado: ${device.name}',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Colors.indigo[900],
              ),
            );
            //todo: colocar por rotas
            Modular.to.push(
              MaterialPageRoute(
                builder: (context) => ControlPage(
                  device: device,
                ),
              ),
            );
          }
        },
        sucessDeviceDisconnected: () {
          if (mounted) {
            Modular.to.pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Dispositivo Desconectado: ${device.name}',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Colors.indigo[900],
              ),
            );
          }
        },
        error: () {
          if (mounted) {
            Modular.to.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Um Erro aconteceu, tente novamente!',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Colors.red[900],
              ),
            );
          }
        },
        orElse: () => {},
      );
}
