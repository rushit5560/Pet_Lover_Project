import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsScreenController extends GetxController{
  File? file;
  RxString selectAnimal = 'Tiger'.obs;
  RxString age = '21'.obs;
  RxString gender = 'Female'.obs;
  RxString breed = '1'.obs;
  RxString weight = '25'.obs;
  final GlobalKey<FormState> detailsFormKey = GlobalKey<FormState>();
  final addDescriptionTextFieldController = TextEditingController();
  final addPriceTextFieldController = TextEditingController();
  final colorTextFieldController = TextEditingController();
}