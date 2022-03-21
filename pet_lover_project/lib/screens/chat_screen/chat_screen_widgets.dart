import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/chat_screen_controller/chat_screen_controller.dart';

import '../conversation_screen/conversation_screen.dart';

class SearchChatTextField extends StatelessWidget {
  SearchChatTextField({Key? key}) : super(key: key);

  final chatScreenController = Get.find<ChatScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            blurStyle: BlurStyle.outer
          )
        ]
      ),
      child: TextFormField(
        controller: chatScreenController.searchTextFieldController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          //isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          suffixIcon: GestureDetector(
            onTap: () {
              print(chatScreenController.searchTextFieldController.text);
            },
            child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue1),
          ),
        ),
      ),
    );
  }
}

class PinnedChatList extends StatelessWidget {
  PinnedChatList({Key? key}) : super(key: key);

  final chatScreenController = Get.find<ChatScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pinned Chat", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          ListView.builder(
            shrinkWrap: true,
              itemCount: chatScreenController.pinnedChat.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    Get.to(()=> ConversationScreen(), transition: Transition.zoom);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, top: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(chatScreenController.pinnedChat[index].image),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chatScreenController.pinnedChat[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(height: 7,),
                                Text(chatScreenController.pinnedChat[index].message, maxLines: 1, style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              Text(chatScreenController.pinnedChat[index].date),
                              SizedBox(height: 10,),
                              index == 0 ?
                                  Container(
                                    height: 5, width: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue
                                    ),
                                  )  : Container()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class RecentChatList extends StatelessWidget {
  RecentChatList({Key? key}) : super(key: key);

  final chatScreenController = Get.find<ChatScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Chat", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: chatScreenController.recentChat.length,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 20, left: 7, right: 7, top: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(chatScreenController.recentChat[index].image),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chatScreenController.recentChat[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(height: 7,),
                                Text(chatScreenController.recentChat[index].message, maxLines: 1, style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              Text(chatScreenController.recentChat[index].date),
                              SizedBox(height: 10,),
                              index == 0 ?
                              Container(
                                height: 5, width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue
                                ),
                              )  : Container()
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

