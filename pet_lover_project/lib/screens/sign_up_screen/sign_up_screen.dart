import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:pet_lover_project/screens/sign_up_screen/sign_up_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AuthScreenBackGroundModule(heading: 'SIGN UP'),

          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 260, bottom: 10),
            child: SignUpForm(),
          ),
        ],
      ),
    );
  }
}
