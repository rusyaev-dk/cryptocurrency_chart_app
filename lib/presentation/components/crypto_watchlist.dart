import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/watchlist_tile.dart';
import 'package:cryptocurrency_chart_app/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoWatchlist extends StatelessWidget {
  const CryptoWatchlist({
    super.key,
    required this.cryptoModels,
  });

  final List<CryptoModel> cryptoModels;

  @override
  Widget build(BuildContext context) {
    if (cryptoModels.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    } else {
      return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 80),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                final currentRoute = GoRouter.of(context)
                    .routeInformationProvider
                    .value
                    .uri
                    .toString();
                print(currentRoute);
                context.push(
                  AppRoutes.cryptoActivity,
                  extra: cryptoModels[i],
                );
              },
              child: SizedBox(
                height: 75,
                child: WatchlistTile(cryptoModel: cryptoModels[i]),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: cryptoModels.length,
        ),
      );
    }
  }
}
