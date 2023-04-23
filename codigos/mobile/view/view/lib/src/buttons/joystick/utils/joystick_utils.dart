import 'dart:math' as math;

import '../model/joystick_item.dart';

double calculatePositionXOfButton({
  required int index,
  required double innerCircleSize,
  required double actualSize,
  required List<JoyStickItem> buttons,
  required double? buttonsPadding,
}) {
  double degrees = 360 / buttons.length * index;
  double lastAngleRadians = (degrees) * (math.pi / 180.0);

  var rBig = actualSize / 2;
  var rSmall = (innerCircleSize + 2 * (buttonsPadding ?? 0.0)) / 2;

  return (rBig - rSmall) + (rBig - rSmall) * math.cos(lastAngleRadians);
}

double calculatePositionYOfButton({
  required int index,
  required double innerCircleSize,
  required double actualSize,
  required List<JoyStickItem> buttons,
  required double? buttonsPadding,
}) {
  double degrees = 360 / buttons.length * index;
  double lastAngleRadians = (degrees) * (math.pi / 180.0);
  var rBig = actualSize / 2;
  var rSmall = (innerCircleSize + 2 * (buttonsPadding ?? 0.0)) / 2;

  return (rBig - rSmall) + (rBig - rSmall) * math.sin(lastAngleRadians);
}
