import 'dart:async';

import 'package:blue_connection/src/module/shared/domain/entities/blue_device.dart';
import 'package:blue_connection/src/module/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:view/view.dart';

class VerticalPage extends StatefulWidget {
  const VerticalPage({super.key, required this.device});
  final Device device;
  @override
  State<VerticalPage> createState() => _VerticalPageState();
}

class _VerticalPageState extends State<VerticalPage> {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.indigo[900],
        title: Text(
          widget.device.name,
          style: GoogleFonts.roboto(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: JoyStick(
            buttonsPadding: 10,
            size: MediaQuery.of(context).size.height * 0.45,
            buttons: [
              JoyStickItem(
                size: MediaQuery.of(context).size.height * 0.100,
                index: 0,
                backgroundColor: Colors.blue[600]!,
                buttonIcon: Icons.keyboard_arrow_right_outlined,
                onTap: () {
                  debugPrint(
                    " index 0",
                  );
                },
              ),
              JoyStickItem(
                size: MediaQuery.of(context).size.height * 0.100,
                index: 1,
                backgroundColor: Colors.yellow[700]!,
                buttonIcon: Icons.keyboard_arrow_down_outlined,
                onTap: () {
                  debugPrint(
                    " index 1",
                  );
                },
              ),
              JoyStickItem(
                size: MediaQuery.of(context).size.height * 0.100,
                index: 2,
                backgroundColor: Colors.red[600]!,
                buttonIcon: Icons.keyboard_arrow_left_outlined,
                onTap: () {
                  debugPrint(
                    " index 2",
                  );
                },
              ),
              JoyStickItem(
                size: MediaQuery.of(context).size.height * 0.100,
                index: 3,
                backgroundColor: Colors.green[600]!,
                buttonIcon: Icons.keyboard_arrow_up_outlined,
                onTap: () {
                  debugPrint(
                    " index 3",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
