import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetProfileScreenController extends GetxController{
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  RxString selectedDate = 'DOB'.obs;
  RxString vaccinate = 'cash'.obs;
  String ? gender;
  String ? breed;
  String ? weight;
  File? file;
  final nameTextFieldController = TextEditingController();
  final colorTextFieldController = TextEditingController();
}