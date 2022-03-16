import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString postOptionValue = 'public'.obs;
  TextEditingController captionFieldController = TextEditingController();
}