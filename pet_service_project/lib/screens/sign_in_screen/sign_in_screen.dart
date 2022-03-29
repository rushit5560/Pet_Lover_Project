import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/common_widgets.dart';
import '../../controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'sign_in_screen_widgets.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AuthScreenBackGroundModule(),

          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  'SIGN IN',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 100, bottom: 10),
                child: SignInForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
