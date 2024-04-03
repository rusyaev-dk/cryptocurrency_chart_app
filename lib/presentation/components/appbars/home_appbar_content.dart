import 'package:cryptocurrency_chart_app/presentation/components/custom_icons.dart';
import 'package:cryptocurrency_chart_app/presentation/components/textfields.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.userName,
    this.userPhotoPath,
  });

  final String userName;
  final String? userPhotoPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeAppBarAvatarStack(),
            const SizedBox(width: 8),
            HomeAppBarWelcomeText(userName: userName),
            const Spacer(),
            const HomeAppBarActionsRow(),
          ],
        ),
        const SizedBox(height: 18),
        const SizedBox(
          height: 48,
          width: double.infinity,
          child: HomeAppBarTextField(),
        ),
        const SizedBox(height: 12),
        Container(
          height: 4,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.appBarDash,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 180);
}

class HomeAppBarAvatarStack extends StatelessWidget {
  const HomeAppBarAvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.greyLight,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 21,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage("assets/images/user_avatar.jpg"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Center(
              child: Text(
                "2",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeAppBarWelcomeText extends StatelessWidget {
  const HomeAppBarWelcomeText({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.greyLight,
          ),
        ),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class HomeAppBarActionsRow extends StatelessWidget {
  const HomeAppBarActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconFromPNG(
          backgroundColor: AppColors.background,
          iconPath: "assets/icons/wallet_icon.png",
        ),
        SizedBox(width: 8),
        CustomIconFromPNG(
          backgroundColor: AppColors.background,
          iconPath: "assets/icons/scan_icon.png",
        ),
      ],
    );
  }
}
