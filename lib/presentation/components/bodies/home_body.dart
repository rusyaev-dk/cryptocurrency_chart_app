import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/blocs/home_bloc/home_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/failure_widget.dart';
import 'package:cryptocurrency_chart_app/presentation/components/home_appbar_content.dart';
import 'package:cryptocurrency_chart_app/presentation/components/user_balance_card.dart';
import 'package:cryptocurrency_chart_app/presentation/components/watchlist_tile.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = "denis";

    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            excludeHeaderSemantics: true,
            elevation: 0,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.appBarBackground,
            title: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 35, bottom: 12),
              child: HomeAppBar(userName: userName),
            ),
            toolbarHeight: 175,
          ),
        ];
      },
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeFailureState) {
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

          if (state is HomeLoadingState) {
            return HomeContent.loading(context);
          }

          if (state is HomeLoadedState) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: HomeContent(cryptoModels: state.cryptoModels),
            );
          }

          return HomeContent.loading(context);
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.cryptoModels,
  });

  static Widget loading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  final List<CryptoModel> cryptoModels;

  @override
  Widget build(BuildContext context) {
    Widget watchlist;
    if (cryptoModels.isEmpty) {
      watchlist = const Center(
        child: Text("No data"),
      );
    } else {
      watchlist = Expanded(
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, i) {
            return SizedBox(
              height: 75,
              child: WatchlistTile(cryptoModel: cryptoModels[i]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: cryptoModels.length,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserBalanceCard(),
        const SizedBox(height: 20),
        const Text(
          "Watchlist",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        watchlist,
      ],
    );
  }
}
