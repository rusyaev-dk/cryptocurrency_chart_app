import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/blocs/crypto_activity_bloc/crypto_activity_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/crypto_price_graphic.dart';
import 'package:cryptocurrency_chart_app/presentation/components/crypto_watchlist.dart';
import 'package:cryptocurrency_chart_app/presentation/components/custom_buttons.dart';
import 'package:cryptocurrency_chart_app/presentation/components/failure_widget.dart';
import 'package:cryptocurrency_chart_app/presentation/formatters/data_formatter.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoActivityBody extends StatelessWidget {
  const CryptoActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoActivityBloc, CryptoActivityState>(
      builder: (context, state) {
        if (state is CryptoActivityFailureState) {
          switch (state.failure) {
            case ApiException.network:
              return FailureWidget(
                failure: state.failure,
                icon: Icons.wifi_off,
              );
            default:
              return FailureWidget(
                failure: state.failure,
                icon: Icons.error,
              );
          }
        }

        if (state is CryptoActivityLoadingState) {
          return CryptoActivityContent.loading(context);
        }

        if (state is CryptoActivityLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: CryptoActivityContent(
              cryptoModels: state.cryptoModels,
              cryptoSymbol: state.cryptoSymbol,
            ),
          );
        }

        return CryptoActivityContent.loading(context);
      },
    );
  }
}

class CryptoActivityContent extends StatelessWidget {
  const CryptoActivityContent({
    super.key,
    required this.cryptoModels,
    required this.cryptoSymbol,
  });

  static Widget loading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  final String cryptoSymbol;
  final List<CryptoModel> cryptoModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CryptoPriceWidget(
          cryptoModel:
              cryptoModels.firstWhere((value) => value.symbol == cryptoSymbol),
        ),
        const SizedBox(height: 10),
        const GraphicPeriodPicker(),
        const SizedBox(
          height: 265,
          child: CryptoPriceGraphic(
            borderData: true,
            gridData: true,
            titlesData: true,
          ),
        ),
        const SizedBox(height: 34),
        const ActivityButtons(),
        const SizedBox(height: 24),
        const QuickWatchRow(),
        const SizedBox(height: 12),
        CryptoWatchlist(cryptoModels: cryptoModels),
      ],
    );
  }
}

class GraphicPeriodPicker extends StatelessWidget {
  const GraphicPeriodPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChartPeriodButton(text: "24H", onPressed: () {}),
          ChartPeriodButton(text: "1W", onPressed: () {}),
          ChartPeriodButton(text: "1M", onPressed: () {}),
          ChartPeriodButton(text: "1Y", onPressed: () {}),
          ChartPeriodButton(text: "All", onPressed: () {}),
        ],
      ),
    );
  }
}

class CryptoPriceWidget extends StatelessWidget {
  const CryptoPriceWidget({
    super.key,
    required this.cryptoModel,
  });

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 6,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DataFormatter.formatCryptoPrice(
                  cryptoPrice: cryptoModel.usdPrice),
              style: const TextStyle(
                fontSize: 32,
                color: AppColors.white,
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.arrow_drop_up_rounded,
                  color: AppColors.green,
                ),
                Text(
                  "105 (%0.8)",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ActivityButtons extends StatelessWidget {
  const ActivityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomColoredButton(
          height: 45,
          width: 135,
          text: "Buy",
          color: AppColors.green,
          onPressed: () {},
        ),
        const SizedBox(width: 13),
        CustomColoredButton(
          height: 45,
          width: 135,
          text: "Sell",
          color: AppColors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}

class QuickWatchRow extends StatelessWidget {
  const QuickWatchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Quick watch",
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            const Text(
              "See all",
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 10,
              width: 5,
              child: Image.asset("assets/icons/arrow_right_icon.png"),
            ),
          ],
        ),
      ],
    );
  }
}
