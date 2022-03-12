import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearByPetServicesScreenController extends GetxController{
  final searchTextFieldController = TextEditingController();
  var servicePageController = PageController(initialPage: 0, viewportFraction: 0.50);
  RxInt selectedPageIndex = 0.obs;
  RxBool ? index1 = false.obs;
  List<String> serviceLists = ['2.5 Km', '2.5 Km', '2.5 Km', '2.5 Km'];

  petServicePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  petServiceNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }
}