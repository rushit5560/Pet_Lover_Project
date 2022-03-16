import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chat_model/chat_model.dart';

class ConversationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final messageTextFieldController = TextEditingController();

  List<ChatModel> chatLists = [
    ChatModel(
      msg: "Hello....Lorem Ipsum is simply dummy text of the printing",
      sendByMe: false,
    ),
    ChatModel(
      msg: "Lorem Ipsum is simply dummy text ??",
      sendByMe: false,
    ),
    ChatModel(
      msg: "Hello...",
      sendByMe: true,
    ),
    ChatModel(
      msg: "Lorem Ipsum is simply dummy text of the printing and typesetting",
      sendByMe: true,
    ),
    ChatModel(
      msg: "Okay...Ipsum is simply dummy ??",
      sendByMe: false,
    ),
    ChatModel(
      msg: "John...Lorem Ipsum is simply dummy text of the printing",
      sendByMe: false,
    ),
    ChatModel(
      msg: "Okay....",
      sendByMe: true,
    ),
    ChatModel(
      msg: "Lorem Ipsum is simply dummy text of the printing and typesetting",
      sendByMe: true,
    ),
  ];
}