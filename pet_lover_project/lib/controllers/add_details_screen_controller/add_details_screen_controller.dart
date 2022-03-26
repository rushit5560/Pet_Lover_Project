import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsScreenController extends GetxController{
  File? file;
  String ? selectAnimal;
  String ? age;
  String ? gender;
  String ? breed;
  String ? weight;
  final GlobalKey<FormState> detailsFormKey = GlobalKey<FormState>();
  final addDescriptionTextFieldController = TextEditingController();
  final addPriceTextFieldController = TextEditingController();
  final colorTextFieldController = TextEditingController();
}