import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/controller/sign_up_screen_controller/sign_up_screen_controller.dart';

import '../controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'constants/app_colors.dart';

InputDecoration signUpFormFieldDecoration(
    {required String hintText, int index = 0}) {
  SignUpScreenController signUpScreenController = SignUpScreenController();
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    // filled: true,
    // fillColor: Colors.white,
    border: InputBorder.none,
    suffixIcon: index == 0
        ? null
        : GestureDetector(
      onTap: () {
        signUpScreenController.isPassVisible.value =
        !signUpScreenController.isPassVisible.value;
        log('isPassVisible : ${signUpScreenController.isPassVisible.value}');
      },
      child: Obx(
            () => Icon(signUpScreenController.isPassVisible.value
            ? Icons.visibility_rounded
            : Icons.visibility_off_rounded),
      ),
    ),
  );
}

InputDecoration signInFormFieldDecoration(
    {required String hintText, int index = 0}) {
  SignInScreenController signInScreenController = SignInScreenController();
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    filled: true,
    fillColor: Colors.white,
    border: InputBorder.none,
    suffixIcon: index == 0
        ? null
        : GestureDetector(
      onTap: () {
        signInScreenController.isPassVisible.value =
        !signInScreenController.isPassVisible.value;
        log('isPassVisible : ${signInScreenController.isPassVisible.value}');
      },
      child: Obx(
            () => Icon(signInScreenController.isPassVisible.value
            ? Icons.visibility_rounded
            : Icons.visibility_off_rounded),
      ),
    ),
  );
}
