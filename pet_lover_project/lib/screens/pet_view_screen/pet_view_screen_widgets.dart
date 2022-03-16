import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/pet_view_screen_controller/pet_view_screen_controller.dart';

class AddPhoto extends StatefulWidget {
  AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final ImagePicker imagePicker = ImagePicker();
  final petViewScreenController = Get.find<PetViewScreenController>();

  XFile? file1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: (){
                  openGallery();
                },
                child: Container(
                  height: Get.height/16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: petViewScreenController.file != null ? Image.file(petViewScreenController.file!, fit: BoxFit.fill,) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.addImageImg, scale: 4,),
                      SizedBox(width: 5,),
                      Text("Add a Photo", style: TextStyle(color: AppColors.colorDarkBlue1, fontSize: 16))
                    ],
                  ),

                ),
              )
          ),
          SizedBox(width: 25,),
          Expanded(
              child: GestureDetector(
                onTap: (){
                  pickVideoFromGallery();
                },
                child: Container(
                  height: Get.height/16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child:
                  //file1 != null ? Image.file(File(file1!.path)) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.addVideoImg, scale: 4,),
                      SizedBox(width: 5,),
                      Text("Add a Video", style: TextStyle(color: AppColors.colorDarkBlue1, fontSize: 16))
                    ],
                  ),
                ),
              )
          ),



        ],
      ),
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        petViewScreenController.file = File(image.path);
        print('Camera File Path : ${petViewScreenController.file}');
        print('Camera Image Path : ${image.path}');
        //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
        //renameImage();
      });
    } else {}
  }

  void pickVideoFromGallery() async {
    file1 = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (file1 != null) {
      setState(() {

      });
    }
  }
}

class PetPostList extends StatelessWidget {
  const PetPostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 1,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(AppImages.chatProfile3Img),
                          ),

                          SizedBox(width: 20,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Denver Ballard", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("2 min ago", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),

                      Container(
                        height: 40,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.colorDarkBlue1.withOpacity(0.5),
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                  blurStyle: BlurStyle.outer
                              )
                            ]
                        ),

                      )

                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
