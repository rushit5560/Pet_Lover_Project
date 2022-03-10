import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/common_widgets.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'sign_in_screen_widgets.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AuthScreenBackGroundModule(heading: 'SIGN IN'),

          Padding(
            padding: const EdgeInsets.all(35),
            child: SignInForm(),
          ),
        ],
      ),
    );
  }
}
