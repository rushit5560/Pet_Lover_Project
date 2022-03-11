import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetProfileScreenController extends GetxController{
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  RxString vaccinate = 'cash'.obs;
  RxString gender = 'Female'.obs;
  RxString breed = '1'.obs;
  RxString weight = '31'.obs;
  File? file;
  final nameTextFieldController = TextEditingController();
  final colorTextFieldController = TextEditingController();
}