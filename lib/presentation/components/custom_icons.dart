import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
  });

  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
    );
  }
}

class CustomIconFromPNG extends StatelessWidget {
  const CustomIconFromPNG({
    super.key,
    required this.backgroundColor,
    required this.iconPath,
  });

  final Color backgroundColor;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(iconPath),
      ),
    );
  }
}
