import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/models/vet_consultation_screen_model/vet_consultation_screen_model.dart';

class VetConsultationScreenController extends GetxController{
  final searchTextFieldController = TextEditingController();

  List<VetConsultationScreenModel> vetChat = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getVetConsultationList();
  }

  getVetConsultationList(){
    vetChat.add(
      VetConsultationScreenModel(
          image: AppImages.vetConsultation1Img,
          name: 'Dr. John Doe',
          experience: '4 year Experience',
        specialist: 'Pet Specialist'
      ),
    );

    vetChat.add(
      VetConsultationScreenModel(
          image: AppImages.vetConsultation2Img,
          name: 'Dr. Dobbie Hayness',
          experience: '3 year Experience',
          specialist: 'Pet Specialist'
      ),
    );

    vetChat.add(
      VetConsultationScreenModel(
          image: AppImages.vetConsultation3Img,
          name: 'Dr. Liliyana Band',
          experience: '2 year Experience',
          specialist: 'Pet Specialist'
      ),
    );

    vetChat.add(
      VetConsultationScreenModel(
          image: AppImages.vetConsultation4Img,
          name: 'Dr. Brianna Shelton',
          experience: '5 year Experience',
          specialist: 'Pet Specialist'
      ),
    );

    vetChat.add(
      VetConsultationScreenModel(
          image: AppImages.vetConsultation5Img,
          name: 'Dr. Martha Tyler',
          experience: '3 year Experience',
          specialist: 'Pet Specialist'
      ),
    );
  }
}