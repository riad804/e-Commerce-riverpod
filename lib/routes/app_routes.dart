import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../views/login_screen.dart';
import '../views/signup_screen.dart';

class AppRoutes {
  AppRoutes._();

  static String login = "/login";
  static String signup = "/signup";
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    // refreshListenable: , //todo auth provider
    initialLocation: AppRoutes.login,
    // redirect: (context, state) {

    // },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
    ],
  );
});
