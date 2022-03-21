import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Image.asset(AppImages.petLoverNameImg, scale: 2.8,),
                    ),
                    const SizedBox(height: 15),

                    const UserDetailsModule(),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: const [
                           PetProfileModule(),
                          SizedBox(height: 10),
                          NotificationModule(),
                          SizedBox(height: 10),
                          LoyaltyPointModule(),
                          SizedBox(height: 10),
                          OnlineVetConsultationModule(),
                          SizedBox(height: 10),
                          CostManagerModule(),
                          SizedBox(height: 10),
                          BlogModule(),
                          SizedBox(height: 10),
                          SignOutModule(),
                          SizedBox(height: 10),
                        ],
                      ),
                    )
                    // const SizedBox(height: 10),
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
