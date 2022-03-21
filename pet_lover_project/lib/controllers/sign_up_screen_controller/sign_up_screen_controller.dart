import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPassVisible = false.obs;
  RxString gender = 'Female'.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController(text: "Demo");
  final emailTextFieldController = TextEditingController(text: "demo@gmail.com");
  final phoneTextFieldController = TextEditingController(text: "1234567890");
  final ageTextFieldController = TextEditingController(text: "24");
  final genderTextFieldController = TextEditingController(text: "Male");
  final locationTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController(text: "313, RTC");
  final passwordTextFieldController = TextEditingController(text: "12345678");
  final confirmPasswordTextFieldController = TextEditingController(text: "12345678");
}