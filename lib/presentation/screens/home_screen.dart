import 'package:cryptocurrency_chart_app/domain/blocs/home_bloc/home_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';
import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_chart_app/presentation/components/bodies/home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(),
      child: BlocProvider(
        create: (context) => HomeBloc(
            cryptoRepository: RepositoryProvider.of<CryptoRepository>(context))
          ..add(HomeLoadCryptoChartEvent()),
        child: const Scaffold(
          backgroundColor: AppColors.background,
          body: HomeBody(),
        ),
      ),
    );
  }
}
