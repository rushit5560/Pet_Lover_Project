import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/chat_screen_controller/chat_screen_controller.dart';
import 'package:pet_lover_project/screens/chat_screen/chat_screen_widgets.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final chatScreenController = Get.put(ChatScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'Chats', appBarOption: AppBarOption.backButtonScreenOption),

            SizedBox(height: 35,),
            SearchChatTextField(),
            SizedBox(height: 20,),

            Expanded(
              child: Column(
                children: [

                  PinnedChatList(),

                  SizedBox(height: 20,),
                  Expanded(
                      child: RecentChatList())
                ],
              ),
            )



          ],
        ).commonPadding()
      ),
    );
  }
}
