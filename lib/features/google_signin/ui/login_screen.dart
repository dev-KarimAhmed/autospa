import 'package:autospa/core/theme/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login With Google'),
      ),

      body:  Center(
        child: ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16.r),
            backgroundColor: ColorsManger.mainBlue,
            foregroundColor: ColorsManger.babyWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: (){}, child: Text('Login With Google'),),
      )
    );
  }
}