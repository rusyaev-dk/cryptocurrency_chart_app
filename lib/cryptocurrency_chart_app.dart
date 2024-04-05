import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';
import 'package:cryptocurrency_chart_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCurrencyChartApp extends StatelessWidget {
  const CryptoCurrencyChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark(),
      ),
    );
  }
}
