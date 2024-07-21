import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:taskema/design/app_asset.dart';
import 'package:taskema/module/login/login_presentation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const path = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule a callback for after the current frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
          const Duration(seconds: 2), () => context.go(LoginPresentation.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAsset.SPLASH_ANIMATION),
    );
  }
}
