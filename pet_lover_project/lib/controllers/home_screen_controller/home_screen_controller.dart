import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final searchTextFieldController = TextEditingController();

  var servicePage = PageController(initialPage: 0,viewportFraction: 0.50);
  var selectedPageIndex = 0.obs;



  List<String> serviceLists = ['2.5 Km', '2.5 Km', '2.5 Km', '2.5 Km'];
}