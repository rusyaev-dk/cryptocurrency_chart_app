import 'package:cryptocurrency_chart_app/domain/blocs/crypto_activity_bloc/crypto_activity_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';
import 'package:cryptocurrency_chart_app/presentation/components/appbars/crypto_activity_appbar.dart';
import 'package:cryptocurrency_chart_app/presentation/components/bodies/crypto_activity_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoActivityScreen extends StatelessWidget {
  const CryptoActivityScreen({super.key, required this.cryptoModel});

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoActivityBloc(
        cryptoRepository: RepositoryProvider.of<CryptoRepository>(context),
      )..add(CryptoActivityLoadCryptoChartEvent(
          cryptoSymbol: cryptoModel.symbol ?? "BTC")),
      child: Scaffold(
        appBar: CryptoActivityAppBar(cryptoModel: cryptoModel),
        body: const CryptoActivityBody(),
      ),
    );
  }
}
