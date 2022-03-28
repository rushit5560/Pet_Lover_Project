import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../controller/user_details_screen_controller/user_details_screen_controller.dart';
import 'user_details_screen_widgets.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key}) : super(key: key);
  final userDetailsScreenController = Get.put(UserDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const UserProfileModule(),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        UserNameModule(),
                        SizedBox(height: 10),
                        UserServiceModule(),
                        SizedBox(height: 10),
                        UserPriceModule(),
                        SizedBox(height: 10),
                        UserTimeModule(),
                        SizedBox(height: 10),
                        UserDescriptionModule(),
                        SizedBox(height: 10),
                      ],
                    ).commonAllSidePadding(),

                  ],
                ),
              ),

              Positioned(
                top: 20,
                  left: 20,
                  child: UserDetailsBackButtonModule(),),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: [
                    MessageButtonModule(),
                    SizedBox(width: 15),
                    ConfirmButtonModule(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
