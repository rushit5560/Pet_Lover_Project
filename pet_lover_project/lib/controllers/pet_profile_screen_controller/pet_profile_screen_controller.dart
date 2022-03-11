import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetProfileScreenController extends GetxController{
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  RxString vaccinate = 'cash'.obs;
  final nameTextFieldController = TextEditingController();
  final colorTextFieldController = TextEditingController();
}