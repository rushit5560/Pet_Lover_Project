import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controller/change_password_screen_controller/change_password_screen_controller.dart';
import 'change_password_screen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.put(ChangePasswordScreenController());

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
                  'CHANGE PASSWORD',
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
                child: ChangePasswordForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
