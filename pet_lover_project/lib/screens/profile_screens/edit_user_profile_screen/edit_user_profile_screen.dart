import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';

import '../../../common/constants/enums.dart';
import '../../../common/custom_appbar/custom_appbar.dart';
import '../../../controllers/edit_user_profile_screen_controller/edit_user_profile_screen_controller.dart';
import 'edit_user_profile_screen_widgets.dart';

class EditUserProfileScreen extends StatelessWidget {
  EditUserProfileScreen({Key? key}) : super(key: key);
  final editUserProfileScreenController =
      Get.put(EditUserProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(
                title: 'Profile',
                appBarOption: AppBarOption.backButtonScreenOption),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ProfileImageModule(),
                    SizedBox(height: 30),
                    NameFieldModule(),
                    SizedBox(height: 25),
                    EmailFieldModule(),
                    SizedBox(height: 25),
                    PhoneFieldModule(),
                    SizedBox(height: 25),
                    AgeFieldModule(),
                    SizedBox(height: 25),
                    GenderFieldModule(),
                    SizedBox(height: 25),
                    AddressFieldModule(),
                    SizedBox(height: 35),
                    EditProfileSaveButtonModule(),
                  ],
                ).commonSymmetricPadding(horizontal: 8),
              ),
            ),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
