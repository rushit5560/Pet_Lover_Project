import 'package:flutter/material.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../constants/app_images.dart';
import 'custom_drawer_widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Drawer(
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Image.asset(AppImages.petLoverNameImg, scale: 2.8,),
                    ),
                    const SizedBox(height: 15),

                    const UserDetailsModule().commonSymmetricPadding(horizontal: 8),
                    const SizedBox(height: 35),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            children: const [
                              MyServicesModule(),
                              SizedBox(height: 20),
                              ChangePasswordModule(),
                              SizedBox(height: 20),
                              SignOutModule(),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
