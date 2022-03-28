
import 'package:flutter/material.dart';

import 'constants/app_colors.dart';

InputDecoration signUpFormFieldDecoration({required String hintText, int index = 0}) {
  // SignInScreenController signInScreenController = SignInScreenController();
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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