import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';

import '../../../controllers/user_profile_screen_controller/user_profile_screen_controller.dart';
import 'user_profile_screen_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  final userProfileScreenController = Get.put(UserProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Stack(
          children: [
            const BackGroundImageModule(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CommonAppBarModule(title: '', appBarOption: AppBarOption.userProfileScreenOption),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ProfileInfoModule(),
                          const SizedBox(height: 20),
                          FollowAndChatButton(),
                          const SizedBox(height: 20),
                          PhotoAndVideoTabModule(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
