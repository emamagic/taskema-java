import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:taskema/module/login/screen/username_password_screen.dart';

class LoginPresentation extends StatefulWidget {
  const LoginPresentation({super.key});
  static const path = "/login";

  @override
  State<LoginPresentation> createState() => _LoginPresentationState();
}

class _LoginPresentationState extends State<LoginPresentation> {
  @override
  void initState() {
    super.initState();
    // Schedule a callback for after the current frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(UsernamePasswordScreen.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
