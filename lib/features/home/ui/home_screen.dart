import 'package:autospa/core/functions/build_custom_loading.dart';
import 'package:autospa/core/helpers/extensions.dart';
import 'package:autospa/core/helpers/spacing.dart';
import 'package:autospa/core/routing/routes.dart';
import 'package:autospa/features/home/logic/cubit/logout_cubit.dart';
import 'package:autospa/features/home/logic/cubit/logout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.userName});
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is Success) {
          context.pushNamedAndRemoveUntil(
            Routes.loginScreen,
            predicate: (route) => false,
          );
        }

        if (state is Loading) buildCustomLoading(context);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                  'Welcome ${userName ?? ""} ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                verticalSpace(100),
                Text('Logout', style: Theme.of(context).textTheme.titleMedium),
                verticalSpace(8),
                IconButton(
                  icon: const Icon(Icons.logout, size: 50),
                  onPressed: () => context.read<LogoutCubit>().logout(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
