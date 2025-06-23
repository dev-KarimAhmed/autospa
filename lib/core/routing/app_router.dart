// ignore_for_file: unused_local_variable

import 'package:autospa/core/routing/routes.dart';
import 'package:autospa/features/google_signin/ui/login_screen.dart';
import 'package:autospa/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
 static Route? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return  MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => HomeScreen(),
        );
      default:
        return null;
    }
  }
}
