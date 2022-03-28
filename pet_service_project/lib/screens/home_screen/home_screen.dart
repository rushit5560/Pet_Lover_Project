import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/constants/app_colors.dart';
import 'package:pet_service_project/common/constants/enums.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/custom_appbar/custom_appbar.dart';
import '../../common/custom_drawer/custom_drawer.dart';
import '../../controller/home_screen_controller/home_screen_controller.dart';
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
        child: Column(
          children: [
            CommonAppBarModule(title: "", appBarOption: AppBarOption.homeScreenOption),
            const SizedBox(height: 35),
            AppointmentTabsModule(),
            const SizedBox(height: 15),
            Expanded(
              child: Obx(
                ()=> Container(
                  child: homeScreenController.isPendingAppointmentSelected.value == 1
                      ? const PendingAppointmentListModule()
                      : const ConfirmAppointmentListModule(),
                ),
              ),
            ),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
