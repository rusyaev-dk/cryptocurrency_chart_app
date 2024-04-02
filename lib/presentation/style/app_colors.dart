import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Colors.white;
  static const Color background = Color(0xFF131316);

  static const Color appBarBackground = Color(0xFF212126);
  static const Color appBarDash = Color(0xFF585866);

  static const Color grey = Color(0xFF575B66);
  static const Color greyLight = Color(0xFFB9C1D9);
  
  static const Color red = Color(0xFFDF2040);
  static const Color green = Color(0xFF40BF6A);

  static List<Color> greenLinearGradient = [
    const Color(0xFF40BF6A).withOpacity(0.4),
    const Color(0xFF40BF6A).withOpacity(0.1),
    const Color(0xFF40BF6A).withOpacity(0),
  ];

  static List<Color> cardLinearGradient = [
    const Color(0xFF182520),
    const Color(0xFF1A2B22),
    const Color(0xFF172225),
    const Color(0xFF112137),
    const Color(0xFF132E4B),
  ];

  static List<Color> dividerLinearGradient = [
    Colors.white,
    AppColors.grey.withOpacity(0.5),
    Colors.white,
  ];
}
