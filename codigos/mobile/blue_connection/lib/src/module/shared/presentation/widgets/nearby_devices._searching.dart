import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/bloc/home_event.dart';

class NearbyDevivesSearching extends StatefulWidget {
  const NearbyDevivesSearching({super.key});

  @override
  State<NearbyDevivesSearching> createState() => _NearbyDevivesSearchingState();
}

class _NearbyDevivesSearchingState extends State<NearbyDevivesSearching>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.indigo[900],
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinKitSpinningLines(
              itemCount: 6,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * .9,
            ),
            FadeTransition(
              opacity: _controller,
              child: const Icon(
                Icons.bluetooth_searching_rounded,
                color: Colors.white,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
