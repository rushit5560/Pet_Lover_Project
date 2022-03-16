import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';

class AdoptPetScreenController extends GetxController{
  final searchTextFieldController = TextEditingController();

  List<String> adoptPetList= [
    AppImages.adoptPet1Img,
    AppImages.adoptPet2Img,
    AppImages.adoptPet3Img,
    AppImages.adoptPet4Img,
    AppImages.adoptPet5Img,
    AppImages.adoptPet6Img
  ];
}