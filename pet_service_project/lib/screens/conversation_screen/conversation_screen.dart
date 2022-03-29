import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/common_functions.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/enums.dart';
import '../../common/custom_appbar/custom_appbar.dart';
import '../../controller/conversation_screen_controller/conversation_screen_controller.dart';
import 'conversation_screen_widgets.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({Key? key}) : super(key: key);
  final conversationScreenController = Get.put(ConversationScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        backgroundColor: AppColors.colorLightBlue,
        body: SafeArea(
          child: Column(
            children: [
              CommonAppBarModule(title: "John Doe", appBarOption: AppBarOption.backButtonScreenOption),
              const SizedBox(height: 20),
              Expanded(child: ChatListModule()),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12, right: 22, left: 22),
                child: MessageFieldModule(),
              ),
              // const SizedBox(height: 10),
            ],
          ).commonAllSidePadding(),
        ),
      ),
    );
  }
}
