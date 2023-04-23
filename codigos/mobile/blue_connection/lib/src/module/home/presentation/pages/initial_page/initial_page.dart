import 'dart:async';
import 'package:blue_connection/config/bluetooth_config/enum/bluetooth_status.dart';
import 'package:blue_connection/src/module/shared/presentation/widgets/nearby_devices._searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();
  late StreamSubscription _subscription;
  @override
  void initState() {
    _subscription = homeBloc.stream.listen(_stateListener);
    homeBloc.add(HomeEvent.enabledBluetooth());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NearbyDevivesSearching();
  }

  _stateListener(HomeState state) => state.maybeWhen(
        sucessEnabledBluetooth: () {
          if (mounted) {
            if (homeBloc.bluetoothController.bluetoothStatus.enabled) {
              homeBloc.add(HomeEvent.requestBondedDevices());
            }
          }
        },
        sucessBondedDevices: () => Modular.to.navigate('/devices'),
        error: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Um Erro aconteceu, tente novamente!',
              style: GoogleFonts.roboto(
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.red[900],
          ),
        ),
        orElse: () => {},
      );
}
