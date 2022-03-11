import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/screens/checkout_screen/checkout_screen_widgets.dart';

class CheckoutScreenController extends GetxController{
  RxInt creditCard = 1.obs;
  RxString payment = 'cash'.obs;
  RxString deliveryAddress = 'home'.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cardNumberTextFieldController = TextEditingController();
  final dateTextFieldController = TextEditingController();
  final cvvTextFieldController = TextEditingController();
}