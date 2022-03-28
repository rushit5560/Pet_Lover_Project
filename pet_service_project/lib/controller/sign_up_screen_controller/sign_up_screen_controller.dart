import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatusSuccess = false.obs;
  RxString selectServiceCategory = "Service Category".obs;
  RxBool isPassVisible = false.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController businessNameFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController cityFieldController = TextEditingController();
  TextEditingController stateFieldController = TextEditingController();
  TextEditingController countryFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController cPasswordFieldController = TextEditingController();


}