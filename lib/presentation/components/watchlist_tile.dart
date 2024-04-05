import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/crypto_price_graphic.dart';
import 'package:cryptocurrency_chart_app/presentation/formatters/data_formatter.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class WatchlistTile extends StatelessWidget {
  const WatchlistTile({
    super.key,
    required this.cryptoModel,
  });

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.watchlistTileBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CryptoNameWidget(
            symbol: cryptoModel.symbol,
          ),
          const SizedBox(
            width: 85,
            height: 35,
            child: CryptoPriceGraphic(),
          ),
          CryptoPriceWidget(price: cryptoModel.usdPrice),
        ],
      ),
    );
  }
}

class CryptoNameWidget extends StatelessWidget {
  const CryptoNameWidget({
    super.key,
    this.symbol,
  });

  final String? symbol;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                DataFormatter.getCryptoLogoPath(
                  cryptoSymbol: symbol,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DataFormatter.cryptoSymbolToFullName(cryptoSymbol: symbol),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              symbol ?? "None",
              style: const TextStyle(
                color: AppColors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CryptoPriceWidget extends StatelessWidget {
  const CryptoPriceWidget({
    super.key,
    required this.price,
  });

  final dynamic price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DataFormatter.formatCryptoPrice(cryptoPrice: price),
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_drop_up_rounded,
              color: AppColors.green,
            ),
            Text(
              "+1.6%",
              style: TextStyle(
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
