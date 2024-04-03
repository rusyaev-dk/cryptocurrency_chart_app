import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/appbars/crypto_activity_appbar.dart';
import 'package:cryptocurrency_chart_app/presentation/components/bodies/activity_body.dart';
import 'package:flutter/material.dart';

class CryptoActivityScreen extends StatelessWidget {
  const CryptoActivityScreen({super.key, required this.cryptoModel});

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActivityAppBar(cryptoModel: cryptoModel),
      body: const ActivityBody(),
    );
  }
}
