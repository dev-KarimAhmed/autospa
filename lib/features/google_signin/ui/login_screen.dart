import 'package:autospa/core/functions/build_custom_loading.dart';
import 'package:autospa/core/helpers/extensions.dart';
import 'package:autospa/core/routing/routes.dart';
import 'package:autospa/core/theme/colors_manger.dart';
import 'package:autospa/features/google_signin/logic/cubit/login_cubit.dart';
import 'package:autospa/features/google_signin/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Success) {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (route) => false,
            arguments: state.username,
          );
        }
        if (state is Loading) {
          buildCustomLoading(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Login With Google')),

          body: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.r),
                backgroundColor: ColorsManger.mainBlue,
                foregroundColor: ColorsManger.babyWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => context.read<LoginCubit>().googleSignIn(),
              child: Text('Login With Google'),
            ),
          ),
        );
      },
    );
  }
}
