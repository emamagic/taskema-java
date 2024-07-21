import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskema/core/app_router.dart';
import 'package:taskema/core/kiwi_container.dart';
import 'package:taskema/core/logger.dart';
import 'package:taskema/data/network/core/dio_provider.dart';
import 'core/app_bloc_observer.dart';

void main() {
  
  Bloc.observer = AppBlocObserver();
  DioProvider();
  setupKiwi();

  if (kDebugMode) {
    Logger.setDebugMode = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.routes,
    );
  }
}

