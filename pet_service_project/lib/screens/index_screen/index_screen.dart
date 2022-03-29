import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/screens/all_appointment_list_screen/all_appointment_list_screen.dart';
import 'package:pet_service_project/screens/blog_screen/blog_screen.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controller/index_screen_controller/index_screen_controller.dart';
import '../home_screen/home_screen.dart';
import '../notification_screen/notification_screen.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          color: AppColors.colorLightBlue,
          child: naviBar(context, changeIndex),
        ),
      ),
      body: Obx(
        () => Container(
          child: getMenuByIndex,
        ),
      ),
    );
  }

  Widget get getMenuByIndex {
    log("menuIndex -> " + indexScreenController.menuIndex.toString());

    if (indexScreenController.menuIndex.value == 0) {
      return HomeScreen();
    } else if (indexScreenController.menuIndex.value == 1) {
      return AllAppointmentListScreen();
    } else if (indexScreenController.menuIndex.value == 2) {
      return BlogScreen();
    } else {
      return NotificationScreen();
    }
  }

  changeIndex(int index) {
    indexScreenController.menuIndex.value = index;
  }

  Widget naviBar(BuildContext context, changeIndex) {
    return Container(
      height: Get.height * 0.07,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.colorLightBlue,
        boxShadow: [
          BoxShadow(
            color: AppColors.colorDarkBlue1.withOpacity(0.2),
            blurRadius: 5,
            // spreadRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 0;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 3),
              padding: const EdgeInsets.all(5),
              height: 35,
              width: 35,
              child: Image.asset(AppImages.homeMenuImg,
                  color: indexScreenController.menuIndex.value == 0
                      ? AppColors.colorDarkBlue
                      : AppColors.colorMenuLightBlue,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(1);
              log("${indexScreenController.menuIndex.value}");
              indexScreenController.menuIndex.value = 1;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              height: 35,
              width: 35,
              child: Image.asset(
                AppImages.appointmentMenuImg,
                color: indexScreenController.menuIndex.value == 1
                    ? AppColors.colorDarkBlue
                    : AppColors.colorMenuLightBlue,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(2);
              log("${indexScreenController.menuIndex.value}");
              indexScreenController.menuIndex.value = 2;
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.only(top: 5),
              height: 35,
              width: 35,
              child: Image.asset(
                AppImages.blogMenuImg,
                color: indexScreenController.menuIndex.value == 2
                    ? AppColors.colorDarkBlue
                    : AppColors.colorMenuLightBlue,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(3);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 3;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              height: 35,
              width: 35,
              child: Image.asset(AppImages.notificationMenuImg,
                  color: indexScreenController.menuIndex.value == 3
                      ? AppColors.colorDarkBlue
                      : AppColors.colorMenuLightBlue,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
