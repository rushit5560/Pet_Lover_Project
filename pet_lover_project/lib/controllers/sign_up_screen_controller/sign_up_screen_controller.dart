import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPassVisible = false.obs;
  RxString gender = 'Female'.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final ageTextFieldController = TextEditingController();
  final genderTextFieldController = TextEditingController();
  final locationTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();
}