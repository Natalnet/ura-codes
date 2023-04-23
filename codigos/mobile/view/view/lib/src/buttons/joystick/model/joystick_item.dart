import 'package:flutter/material.dart';

class JoyStickItem {
  final int index;

  final IconData buttonIcon;

  final Color backgroundColor;

  final double size;

  final VoidCallback onTap;

  const JoyStickItem({
    required this.size,
    required this.index,
    required this.buttonIcon,
    required this.backgroundColor,
    required this.onTap,
  });
}
