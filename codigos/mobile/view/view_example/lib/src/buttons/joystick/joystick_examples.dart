import 'package:flutter/material.dart';
import 'package:view/components/buttons.dart' show JoyStick, JoyStickItem;
import 'package:view_example/component_example.dart';

class JoyStickExamples extends ComponentExample {
  static JoyStick standard() {
    return JoyStick(
      buttonsPadding: 10,
      size: 300,
      buttons: [
        JoyStickItem(
          size: 70,
          index: 0,
          backgroundColor: Colors.blue[600]!,
          buttonIcon: Icons.keyboard_arrow_right_outlined,
        ),
        JoyStickItem(
          size: 70,
          index: 1,
          backgroundColor: Colors.yellow[700]!,
          buttonIcon: Icons.keyboard_arrow_down_outlined,
        ),
        JoyStickItem(
          size: 70,
          index: 2,
          backgroundColor: Colors.red[600]!,
          buttonIcon: Icons.keyboard_arrow_left_outlined,
        ),
        JoyStickItem(
          size: 70,
          index: 3,
          backgroundColor: Colors.green[600]!,
          buttonIcon: Icons.keyboard_arrow_up_outlined,
        ),
      ],
    );
  }

  @override
  Map<String, Widget> examples() {
    return {
      "standard": standard(),
    };
  }

  @override
  String get name => "JoyStick";
}
