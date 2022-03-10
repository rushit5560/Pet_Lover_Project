import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet_lover_project/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';

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
