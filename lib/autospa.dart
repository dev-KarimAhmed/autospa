import 'package:autospa/core/routing/app_router.dart';
import 'package:autospa/core/routing/routes.dart';
import 'package:flutter/material.dart';

class Autospa extends StatelessWidget {
  const Autospa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.loginScreen,
    );
  }
}