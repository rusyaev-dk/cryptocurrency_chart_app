import 'package:cryptocurrency_chart_app/presentation/screens/auth_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/branches_switcher_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/chart_screen.dart';
import 'package:cryptocurrency_chart_app/presentation/screens/home_screen.dart';
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
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.chart,
              builder: (context, state) => const ChartScreen(),
            ),
          ]),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
