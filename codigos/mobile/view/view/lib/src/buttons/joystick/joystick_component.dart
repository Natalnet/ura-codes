import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:view/src/buttons/joystick/utils/joystick_utils.dart';

import '../button_circular/button_circular_component.dart';
import 'model/joystick_item.dart';

class JoyStick extends StatelessWidget {
  final double size;

  final List<JoyStickItem> buttons;

  final double? buttonsPadding;

  const JoyStick({
    super.key,
    required this.size,
    required this.buttons,
    this.buttonsPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    double? actualSize = size;
    0.5;
    double innerCircleSize = actualSize / 3;

    return Stack(
      children: createButtons(innerCircleSize, actualSize),
    );
  }

  List<Widget> createButtons(double innerCircleSize, double actualSize) {
    List<Widget> list = [];
    list.add(
      Container(
        width: actualSize,
        height: actualSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );

    for (var i = 0; i < buttons.length; i++) {
      var padButton = buttons[i];
      list.add(createPositionedButtons(
        padButton,
        actualSize,
        i,
        innerCircleSize,
      ));
    }
    return list;
  }

  Positioned createPositionedButtons(
    JoyStickItem paddButton,
    double actualSize,
    int index,
    double innerCircleSize,
  ) {
    return Positioned(
      top: calculatePositionYOfButton(
        index: index,
        innerCircleSize: innerCircleSize,
        actualSize: actualSize,
        buttons: buttons,
        buttonsPadding: buttonsPadding,
      ),
      left: calculatePositionXOfButton(
        index: index,
        innerCircleSize: innerCircleSize,
        actualSize: actualSize,
        buttons: buttons,
        buttonsPadding: buttonsPadding,
      ),
      child: Padding(
        padding: EdgeInsets.all(buttonsPadding!),
        child: CircularButton(
          backgroundColor: paddButton.backgroundColor,
          width: innerCircleSize,
          height: innerCircleSize,
          icon: paddButton.buttonIcon,
          iconSize: paddButton.size,
          onTap: () {
            debugPrint(
              " ${[paddButton.index]}",
            );
          },
        ),
      ),
    );
  }
}
