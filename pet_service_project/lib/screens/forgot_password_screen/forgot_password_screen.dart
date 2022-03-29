import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controller/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'forgot_password_screen_widgets.dart';

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
          const AuthScreenBackGroundModule(),

          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  'FORGOT PASSWORD',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 160),
              Padding(
                padding: const EdgeInsets.all(35),
                child: ForgotPasswordForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
