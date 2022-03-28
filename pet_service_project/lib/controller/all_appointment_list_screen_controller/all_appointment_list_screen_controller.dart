import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAppointmentListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isAppointmentTabSelected = 1.obs;
  TextEditingController searchFieldController = TextEditingController();
}