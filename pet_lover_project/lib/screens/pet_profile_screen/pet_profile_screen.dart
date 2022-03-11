import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/controllers/pet_profile_screen_controller/pet_profile_screen_controller.dart';
import 'package:pet_lover_project/screens/pet_profile_screen/pet_profile_screen_widgets.dart';

class PetProfileScreen extends StatelessWidget {
  PetProfileScreen({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(PetProfileScreenController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AuthScreenBackGroundModule(heading: 'PROFILE'),

          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 100),
            child: ProfileForm(),
          ),
        ],
      ),
    );
  }
}
