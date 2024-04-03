import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/auth_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/branches_switcher_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/crypto_activity_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/home_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/placeholder.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/route_error_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/screen_loader.dart';
import 'package:cryptocurrency_chart_app/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    errorBuilder: (context, state) => const RouteErrorScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.screenLoader,
        builder: ((context, state) => const ScreenLoader()),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: ((context, state) => const AuthScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BranchesSwitcherScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: "crypto_activity",
                    builder: (context, state) {
                      final extra = state.extra as CryptoModel;
                      return CryptoActivityScreen(cryptoModel: extra);
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.activity,
                builder: (context, state) => const PlaceholderScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
