import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';

import '../../common/constants/app_colors.dart';
import '../../common/custom_appbar/custom_appbar.dart';
import '../../controllers/service_details_screen_controller/service_details_screen_controller.dart';
import 'service_details_screen_widgets.dart';

class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({Key? key}) : super(key: key);
  final serviceDetailsScreenController = Get.put(ServiceDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: CommonAppBarModule(title: 'Service Details', appBarOption: AppBarOption.backButtonScreenOption),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ServiceImageListModule(),
                    const SizedBox(height: 10),
                    ServiceImageListIndicatorModule(),
                    const SizedBox(height: 20),
                    ProductnameAndDescriptionModule(),
                    const SizedBox(height: 20),
                    const AddressModule(),
                    const SizedBox(height: 20),
                    const DirectionAndShareModule(),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
