  import 'package:autospa/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildCustomLoading(BuildContext context) {
    return showDialog(
            context: context,
            builder:
                (_) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.mainBlue,
                  ),
                ),
          );
  }