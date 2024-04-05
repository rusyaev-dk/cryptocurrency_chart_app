import 'package:cryptocurrency_chart_app/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteErrorScreen extends StatelessWidget {
  const RouteErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              size: 160,
            ),
            const SizedBox(height: 20),
            const Text(
              "Ooops, something went worng",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 80,
              child: FloatingActionButton(
                onPressed: () {
                  context.go(AppRoutes.home);
                },
                child: const Center(
                  child: Text(
                    "Go home",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
