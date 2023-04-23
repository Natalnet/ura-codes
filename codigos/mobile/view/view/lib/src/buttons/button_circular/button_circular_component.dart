import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color backgroundColor;
  final double iconSize;
  final BorderRadiusGeometry? borderradius;

  const CircularButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.iconSize,
    this.borderradius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderradius ?? BorderRadius.circular(100),
          ),
        ),
        child: Icon(icon, size: iconSize),
      ),
    );
  }
}
