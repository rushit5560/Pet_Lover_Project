import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'package:pet_lover_project/screens/Forgot_password_screen/forgot_password_screen_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AuthScreenBackGroundModule(heading: 'FORGOT PASSWORD'),

          Padding(
            padding: const EdgeInsets.all(35),
            child: ForgotPasswordForm(),
          ),
        ],
      ),
    );
  }
}
