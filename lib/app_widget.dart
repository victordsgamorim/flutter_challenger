import 'package:flutter/material.dart';
import 'package:flutter_challenger/core/route/app_route.dart';
import 'package:flutter_challenger/core/theme/app_theme.dart';

class FlutterChallenger extends StatelessWidget {
  const FlutterChallenger({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routerDelegate: AppRoutes.router.routerDelegate,
      routeInformationParser: AppRoutes.router.routeInformationParser,
    );
  }
}
