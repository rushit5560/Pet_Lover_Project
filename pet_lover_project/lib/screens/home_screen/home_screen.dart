import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_drawer/custom_drawer.dart';

import '../../common/custom_appbar/custom_appbar.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CommonAppBarModule(title: 'Pet Lover', appBarOption: AppBarOption.homeScreenOption),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeSearchFieldModule(),
                      const SizedBox(height: 20),
                      const PetShopModule(),
                      const SizedBox(height: 20),
                      PetServicesModule(),
                      const SizedBox(height: 20),
                      const ReminderContainerModule(),
                      const SizedBox(height: 20),
                      PetMatchModule(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
