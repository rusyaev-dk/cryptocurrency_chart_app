import 'package:cryptocurrency_chart_app/presentation/components/custom_icons.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBarTextField extends StatelessWidget {
  const HomeAppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Padding(
          padding:  EdgeInsets.all(4),
          child:  CustomIconFromPNG(
              backgroundColor: AppColors.background,
              iconPath: "assets/icons/search_icon.png",
            ),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.all(4),
          child: CustomIconFromPNG(
            backgroundColor: AppColors.appBarBackground,
            iconPath: "assets/icons/tune_icon.png",
          ),
        ),
        hintText: "Search...",
        hintStyle: const TextStyle(color: AppColors.grey),
      ),
    );
  }
}
