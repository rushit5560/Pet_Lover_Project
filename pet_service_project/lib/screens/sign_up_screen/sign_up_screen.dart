import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/common_widgets.dart';
import '../../controller/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'sign_up_screen_widgets.dart';

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

          Column(
            children: [
              const Expanded(
                flex: 35,
                child: SizedBox(),
              ),
              Expanded(
                flex: 65,
                child: SignUpFormModule(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
