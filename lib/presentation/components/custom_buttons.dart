import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarButton extends StatelessWidget {
  const CustomBottomNavBarButton({
    super.key,
    this.onPressed,
    this.width = 110,
    this.height = 45,
    this.fontSize = 15,
    this.textColor = Colors.white,
  });

  final void Function()? onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.bottomButtonGradientColors,
              stops: [0.52, 1.0],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(height),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/icons/plus_icon.png"),
          ),
        ),
      ),
    );
  }
}
