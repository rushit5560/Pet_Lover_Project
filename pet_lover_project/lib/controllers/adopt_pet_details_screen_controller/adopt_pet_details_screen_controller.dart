import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';

class AdoptPetDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  TextEditingController makeOfferTextFieldController = TextEditingController();
  List<String> petImageLists = [(AppImages.adoptPet4Img), (AppImages.adoptPet5Img), (AppImages.adoptPet1Img)];
  RxInt activeIndex = 0.obs;
  String descriptionText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
}