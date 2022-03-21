import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPassVisible = false.obs;

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final emailTextFieldController = TextEditingController(text: "abc@gmail.com");
  final passwordTextFieldController = TextEditingController(text: "12345678");

}