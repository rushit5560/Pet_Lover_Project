import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/models/chat_model/chat_model.dart';
import '../../common/common_functions.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/conversation_screen_controller/conversation_screen_controller.dart';

class ChatListModule extends StatelessWidget {
  ChatListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ConversationScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.chatLists.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        ChatModel singleChat = screenController.chatLists[i];
        return Container(
          margin: const EdgeInsets.all(5),
          padding: singleChat.sendByMe
              ? const EdgeInsets.only(left: 40)
              : const EdgeInsets.only(right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: singleChat.sendByMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: singleChat.sendByMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: screenController.chatLists[i].sendByMe
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: singleChat.sendByMe
                            ? AppColors.colorDarkBlue
                            : Colors.white,
                        borderRadius: singleChat.sendByMe
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                      ),
                      child: Column(
                        crossAxisAlignment: singleChat.sendByMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            singleChat.msg,
                            textAlign: singleChat.sendByMe
                                ? TextAlign.end
                                : TextAlign.start,
                            style: TextStyle(
                              color: singleChat.sendByMe
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '12:55 AM',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 11,
                                color: screenController.chatLists[i].sendByMe
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class MessageFieldModule extends StatelessWidget {
  MessageFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ConversationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: AppColors.colorLightBlue,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer
            )
          ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: AppColors.colorLightBlue,
        child: Row(
          children: [
            _iconModule(imgName: AppImages.emojiImg),
            const SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                controller: screenController.messageTextFieldController,
                cursorColor: AppColors.colorDarkBlue,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: InputBorder.none,
                  hintText: 'Type a Message',
                  hintStyle: TextStyle(color: AppColors.colorDarkBlue,),
                ),
              ),
            ),
            const SizedBox(width: 5),
            _iconModule(imgName: AppImages.micImg),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                screenController.messageTextFieldController.clear();
                // hideKeyboard();
              },
              child: _iconModule(imgName: AppImages.sendImg),
            ),
          ],
        ),
      ),
    );
  }


  Widget _iconModule({required String imgName}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imgName),
        ),
      ),
    );
  }
}
