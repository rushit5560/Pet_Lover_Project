import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/screens/cart_screen/cart_screen.dart';
import 'package:pet_lover_project/screens/home_screen/home_screen.dart';
import 'package:pet_lover_project/screens/pet_shop_screen/pet_shop_screen.dart';
import 'package:pet_lover_project/screens/pet_view_screen/pet_view_screen.dart';

import '../../common/constants/app_images.dart';
import '../../controllers/index_screen_controller/index_screen_controller.dart';

class IndexScreen extends StatelessWidget {
  final indexScreenController = Get.put(IndexScreenController());

  IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Obx(() => indexScreenController
    //       .tabs[indexScreenController.currentSelectedIndex.value]),
    //   bottomNavigationBar: Padding(
    //     padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 2),
    //     child: Material(
    //       elevation: 10,
    //       borderRadius: BorderRadius.circular(15),
    //       color: AppColors.colorLightBlue,
    //       child: Container(
    //         height: Get.height * 0.08,
    //         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(15),
    //             color: AppColors.colorLightBlue
    //             // color: Colors.black,
    //             ),
    //         child: Obx(
    //           ()=> BottomNavigationBar(
    //             currentIndex: indexScreenController.currentSelectedIndex.value,
    //             type: BottomNavigationBarType.fixed,
    //             showSelectedLabels: false,
    //             showUnselectedLabels: false,
    //             onTap: (index) {
    //                 indexScreenController.currentSelectedIndex.value = index;
    //             },
    //             items: const [
    //               BottomNavigationBarItem(
    //                 icon: Image(
    //                   image: AssetImage(AppImages.index1Img),
    //                   height: 25,
    //                   width: 25,
    //                 ),
    //                 label: '',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: Image(
    //                   image: AssetImage(AppImages.index2Img),
    //                   height: 25,
    //                   width: 25,
    //                 ),
    //                 label: '',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: Image(
    //                   image: AssetImage(AppImages.index3Img),
    //                   height: 25,
    //                   width: 25,
    //                 ),
    //                 label: '',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: Image(
    //                   image: AssetImage(AppImages.index4Img),
    //                   height: 25,
    //                   width: 25,
    //                 ),
    //                 label: '',
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      bottomNavigationBar: Obx(() => naviBar(context, changeIndex)),
      body: Obx(
        () => Container(
          child: getMenuByIndex,
        ),
      ),
    );
  }

  Widget get getMenuByIndex {
    if (kDebugMode) {
      print("menuIndex -> " + indexScreenController.menuIndex.toString());
    }

    if (indexScreenController.menuIndex.value == 0) {
      return HomeScreen();
    } else if (indexScreenController.menuIndex.value == 1) {
      return PetViewScreen();
    } else if (indexScreenController.menuIndex.value == 2) {
      return PetShopScreen();
    } else {
      return HomeScreen();
    }
  }

  changeIndex(int index) {
    //setState(() {
    indexScreenController.menuIndex.value = index;
    //});
  }

  Widget naviBar(BuildContext context, changeIndex) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.colorLightBlue,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              changeIndex.call(0);
              if (kDebugMode) {
                print(indexScreenController.menuIndex.value);
              }
              indexScreenController.menuIndex.value = 0;
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              child: Image.asset(AppImages.index1Img,
                  color: indexScreenController.menuIndex.value == 0
                      ? AppColors.colorDarkBlue
                      : AppColors.colorMenuLightBlue),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(1);
              if (kDebugMode) {
                print(indexScreenController.menuIndex.value);
              }
              indexScreenController.menuIndex.value = 1;
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              child: Image.asset(
                AppImages.index2Img,
                color: indexScreenController.menuIndex.value == 1
                    ? AppColors.colorDarkBlue
                    : AppColors.colorMenuLightBlue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(2);
              if (kDebugMode) {
                print(indexScreenController.menuIndex.value);
              }
              indexScreenController.menuIndex.value = 2;
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(top: 5),
              height: 30,
              width: 30,
              child: Image.asset(
                AppImages.index3Img,
                color: indexScreenController.menuIndex.value == 2
                    ? AppColors.colorDarkBlue
                    : AppColors.colorMenuLightBlue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(3);
              if (kDebugMode) {
                print(indexScreenController.menuIndex.value);
              }
              indexScreenController.menuIndex.value = 3;
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              child: Image.asset(AppImages.index4Img,
                  color: indexScreenController.menuIndex.value == 3
                      ? AppColors.colorDarkBlue
                      : AppColors.colorMenuLightBlue),
            ),
          ),
        ],
      ),
    );
  }
}
