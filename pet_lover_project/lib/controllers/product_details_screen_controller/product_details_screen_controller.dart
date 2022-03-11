import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';

class ProductDetailsScreenController extends GetxController {
  List<String> productImageLists = [(AppImages.accessories1Img), (AppImages.accessories2Img), (AppImages.accessories3Img)];
  RxInt activeIndex = 0.obs;
  RxInt productItemQty = 1.obs;
  String descriptionText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  List<String> relatedProductList = [(AppImages.product1Img), (AppImages.product2Img), (AppImages.product3Img), (AppImages.product1Img), (AppImages.product2Img), (AppImages.product3Img)];
  var relatedPageController = PageController(initialPage: 0, viewportFraction: 0.50);
  RxInt selectedRelatedIndex = 0.obs;

  relatedProductPreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  relatedProductNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

}