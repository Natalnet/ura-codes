import 'package:blue_connection/src/module/home/presentation/bloc/home_bloc.dart';
import 'package:blue_connection/src/module/home/presentation/bloc/home_event.dart';
import 'package:blue_connection/src/module/control/pages/horizontal_page.dart';
import 'package:blue_connection/src/module/control/pages/vertical_page.dart';
import 'package:blue_connection/src/module/shared/domain/entities/blue_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key, required this.device});

  final Device device;

  @override
  State<ControlPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ControlPage> {
  @override
  void dispose() {
    Modular.get<HomeBloc>()
        .add(HomeEvent.requestDisconnectDevice(device: widget.device));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? VerticalPage(
                device: widget.device,
              )
            : const HorizontalPage();
      },
    );
  }
}
