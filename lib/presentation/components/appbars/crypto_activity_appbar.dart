import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/custom_icons.dart';
import 'package:cryptocurrency_chart_app/presentation/formatters/data_formatter.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActivityAppBar({
    super.key,
    required this.cryptoModel,
  });

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 45, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const CustomIconFromPNG(
              backgroundColor: AppColors.appBarBackground,
              iconPath: "assets/icons/arrow_back_icon.png",
            ),
          ),
          AppBarCryptoBunchRow(
            cryptoModel: cryptoModel,
          ),
          const CustomIconFromPNG(
            backgroundColor: AppColors.appBarBackground,
            iconPath: "assets/icons/chart_icon.png",
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 95);
}

class AppBarCryptoBunchRow extends StatelessWidget {
  const AppBarCryptoBunchRow({
    super.key,
    required this.cryptoModel,
  });

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Image.asset(
            DataFormatter.getCryptoLogoPath(
              cryptoSymbol: cryptoModel.symbol,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "${cryptoModel.symbol ?? 'BTC'} / USDT",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
