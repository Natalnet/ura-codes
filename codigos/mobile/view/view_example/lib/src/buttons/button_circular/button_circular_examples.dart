import 'package:flutter/material.dart';
import 'package:view_example/component_example.dart';
import 'package:view/components/buttons.dart' show CircularButton;

class ButtonCircularExamples extends ComponentExample {
  static CircularButton standard() {
    return CircularButton(
        iconSize: 70,
        icon: Icons.arrow_back,
        onTap: () => debugPrint('tap'),
        height: 100,
        width: 100,
        backgroundColor: Colors.blueAccent);
  }

  @override
  Map<String, Widget> examples() {
    return {
      "standard": standard(),
    };
  }

  @override
  String get name => "CircularButton";
}
