import 'dart:io';

import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/models/pet_view_screen_model/pet_view_screen_model.dart';

class PetViewScreenController extends GetxController{
  File? file;
  List<PetViewScreenModel> postList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPatPostList();
  }

  getPatPostList(){
    postList.add(
      PetViewScreenModel(
          image: AppImages.chatProfile1Img,
          name: 'Denver Ballard'
      ),
    );

    postList.add(
      PetViewScreenModel(
          image: AppImages.chatProfile2Img,
          name: 'Willam John',
      ),
    );
  }
}