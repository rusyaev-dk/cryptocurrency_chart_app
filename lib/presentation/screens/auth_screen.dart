import 'package:cryptocurrency_chart_app/presentation/components/bodies/auth_body.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const AuthScreenBody(),
    );
  }
}
