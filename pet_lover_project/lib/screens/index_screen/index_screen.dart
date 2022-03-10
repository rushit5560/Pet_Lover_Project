import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';

import '../../common/constants/app_images.dart';
import '../../controllers/index_screen_controller/index_screen_controller.dart';

class IndexScreen extends StatelessWidget {
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => indexScreenController
          .tabs[indexScreenController.currentSelectedIndex.value]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 2),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          color: AppColors.colorLightBlue,
          child: Container(
            height: Get.height * 0.08,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.colorLightBlue
                // color: Colors.black,
                ),
            child: Obx(
              ()=> BottomNavigationBar(
                currentIndex: indexScreenController.currentSelectedIndex.value,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                    indexScreenController.currentSelectedIndex.value = index;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(AppImages.index1Img),
                      height: 25,
                      width: 25,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(AppImages.index2Img),
                      height: 25,
                      width: 25,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(AppImages.index3Img),
                      height: 25,
                      width: 25,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(AppImages.index4Img),
                      height: 25,
                      width: 25,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
