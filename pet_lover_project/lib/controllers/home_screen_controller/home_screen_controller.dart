import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';

class HomeScreenController extends GetxController {
  final searchTextFieldController = TextEditingController();

  var servicePage = PageController(initialPage: 0, viewportFraction: 0.50);
  var matchPage = PageController(initialPage: 0, viewportFraction: 0.33);
  RxInt selectedPageIndex = 0.obs;
  RxInt selectedPetMatchIndex = 0.obs;

  List<String> serviceLists = ['2.5 Km', '2.5 Km', '2.5 Km', '2.5 Km'];
  List<String> petMatchList = [
    (AppImages.dog1Img),
    (AppImages.dog2Img),
    (AppImages.dog3Img),
    (AppImages.dog1Img),
    (AppImages.dog2Img),
    (AppImages.dog3Img),
  ];

  petServicePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  petServiceNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

}
