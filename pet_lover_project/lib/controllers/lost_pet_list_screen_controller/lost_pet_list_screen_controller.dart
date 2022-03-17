import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';

class LostPetListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController searchFieldController = TextEditingController();

  List<String> petLostList = [
    (AppImages.lostPet1Img), (AppImages.lostPet2Img),
    (AppImages.lostPet3Img), (AppImages.lostPet4Img),
    (AppImages.lostPet5Img), (AppImages.lostPet6Img),
    (AppImages.lostPet1Img), (AppImages.lostPet2Img),
    (AppImages.lostPet3Img), (AppImages.lostPet4Img),
    (AppImages.lostPet5Img), (AppImages.lostPet6Img),
  ];
}