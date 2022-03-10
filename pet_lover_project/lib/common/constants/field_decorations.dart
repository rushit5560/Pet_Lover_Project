import 'package:flutter/material.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../controllers/pet_shop_screen_controller/pet_shop_screen_controller.dart';
import 'app_colors.dart';


InputDecoration signInFormFieldDecoration(
    {required String hintText, int index = 0}) {
  // SignInScreenController signInScreenController = SignInScreenController();
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    filled: true,
    fillColor: Colors.white,
    border: InputBorder.none,
    // suffix: IconButton(
    //   onPressed: () {},
    //   iconSize: 15,
    //   icon: Icon(Icons.visibility_off_rounded),
    // ),
    // suffix: Container(
    //   child: index == 0
    //       ? null
    //       : GestureDetector(
    //     onTap: () {
    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
    //     },
    //     child: Obx(
    //       ()=> Icon(signInScreenController.isPassVisible.value
    //           ? Icons.visibility_rounded
    //           : Icons.visibility_off_rounded),
    //     ),
    //   ),
    // ),
  );
}

InputDecoration searchFieldDecoration(PetShopScreenController screenController) {
  return InputDecoration(
    hintText: 'Search',
    hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
    border: InputBorder.none,
    isDense: true,
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    suffixIcon: GestureDetector(
      onTap: () {
        print(screenController.searchTextFieldController.text);
      },
      child: Icon(Icons.search_rounded, color: AppColors.colorLightBlue1),
    ),
  );
}

InputDecoration searchFieldDecorationHomeScreen(HomeScreenController screenController) {
  return InputDecoration(
    hintText: 'Search',
    hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
    border: InputBorder.none,
    isDense: true,
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    suffixIcon: GestureDetector(
      onTap: () {
        print(screenController.searchTextFieldController.text);
      },
      child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue),
    ),
  );
}