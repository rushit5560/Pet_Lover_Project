import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/models/chat_screen_model/chat_screen_model.dart';

class ChatScreenController extends GetxController{
  final searchTextFieldController = TextEditingController();
  List<ChatScreenModel> pinnedChat = [];
  List<ChatScreenModel> recentChat = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPinnedChatList();
    getRecentChatList();
  }

  getPinnedChatList(){
    pinnedChat.add(
      ChatScreenModel(
          image: AppImages.chatProfile1Img,
          name: 'John Doe',
          message: 'Lorem Ipsum is simply dummy text of the printing',
          date: '12:55'
      ),
    );

    pinnedChat.add(
      ChatScreenModel(
          image: AppImages.chatProfile1Img,
          name: 'John Doe',
          message: 'Lorem Ipsum is simply dummy text of the printing',
          date: '12:55'
      ),
    );
  }

  getRecentChatList(){
    recentChat.add(
      ChatScreenModel(
          image: AppImages.chatProfile2Img,
          name: 'Denver Ballard',
          message: 'Lorem Ipsum is simply dummy text of the printing',
          date: '10:55'
      ),
    );

    recentChat.add(
      ChatScreenModel(
          image: AppImages.chatProfile3Img,
          name: 'Elose Walton',
          message: 'Lorem Ipsum is simply dummy text of the printing',
          date: '10:50'
      ),
    );

    recentChat.add(
      ChatScreenModel(
          image: AppImages.chatProfile4Img,
          name: 'Willam John',
          message: 'Lorem Ipsum is simply dummy text of the printing',
          date: '09:16'
      ),
    );

    recentChat.add(
      ChatScreenModel(
          image: AppImages.chatProfile5Img,
          name: 'Lily Dolley',
          message: 'Lorem Ipsum is simply dummy text of the printing',
          date: '08:30'
      ),
    );
  }
}