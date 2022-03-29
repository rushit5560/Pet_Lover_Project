import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isOldPassVisible = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isCNewPasswordVisible = false.obs;

  GlobalKey<FormState> changeFormKey = GlobalKey();
  TextEditingController oldPasswordFieldController = TextEditingController();
  TextEditingController newPasswordFieldController = TextEditingController();
  TextEditingController cNewPasswordFieldController = TextEditingController();
}