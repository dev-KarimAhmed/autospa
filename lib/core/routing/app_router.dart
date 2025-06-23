// ignore_for_file: unused_local_variable

import 'package:autospa/core/routing/base_route.dart';
import 'package:autospa/core/routing/routes.dart';
import 'package:autospa/features/google_signin/logic/cubit/login_cubit.dart';
import 'package:autospa/features/google_signin/ui/login_screen.dart';
import 'package:autospa/features/home/logic/cubit/logout_cubit.dart';
import 'package:autospa/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => LogoutCubit(),
            child: HomeScreen(
              userName: arguments as String?,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
