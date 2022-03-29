import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordScreenController extends GetxController{
  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  final emailTextFieldController = TextEditingController();
  final otpTextFieldController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  RxString currentText = "".obs;
}