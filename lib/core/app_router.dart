import 'package:go_router/go_router.dart';
import 'package:taskema/module/login/login_presentation.dart';
import 'package:taskema/module/login/screen/username_password_screen.dart';
import 'package:taskema/module/splash/splash_screen.dart';

class AppRouter {
  static final routes = GoRouter(initialLocation: "/" ,routes: [
    GoRoute(
        name: (SplashScreen).toString(),
        path: SplashScreen.path,
        builder: (context, state) => const SplashScreen()
        ),
    GoRoute(
      name: (LoginPresentation).toString(),
      path: LoginPresentation.path,
      builder: (context, state) => const LoginPresentation(),
    ),
    GoRoute(
      name: (UsernamePasswordScreen).toString(),
      path: UsernamePasswordScreen.path,
      builder: (context, state) => UsernamePasswordScreen(),
      ),
  ]);
}
