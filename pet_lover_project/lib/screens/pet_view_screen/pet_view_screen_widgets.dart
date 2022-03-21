import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/pet_view_screen_controller/pet_view_screen_controller.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: (){
                  openGallery();
                },
                child: Container(
                  height: Get.height/15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.colorDarkBlue1.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.outer
                      ),
                    ],
                  ),
                  child: petViewScreenController.file != null ? Image.file(petViewScreenController.file!, fit: BoxFit.fill,) :
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImages.addImageImg, scale: 4,),
                        //SizedBox(width: 5,),
                        Text("Add a Photo", style: TextStyle(color: AppColors.colorDarkBlue1, fontSize: 16))
                      ],
                    ),
                  ),

                ),
              )
          ),
          const SizedBox(width: 25),
          Expanded(
              child: GestureDetector(
                onTap: (){
                  pickVideoFromGallery();
                },
                child: Container(
                  height: Get.height/15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.colorDarkBlue1.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.outer
                      ),
                    ],
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImages.addVideoImg, scale: 4,),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                              "Add a Video",
                              maxLines: 1,
                              // overflow: TextOverflow.clip,
                              style: TextStyle(color: AppColors.colorDarkBlue1, fontSize: 16),),
                        ),
                      ],
                    ),
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
  PetPostList({Key? key}) : super(key: key);

  final petViewScreenController = Get.find<PetViewScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: petViewScreenController.postList.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      profileDetails(index),
                      const SizedBox(height: 20),
                      profileDescription(),
                      const SizedBox(height: 20),
                      profileImage(index)

                    ],
                  ),
                  Column(
                    children: [
                      index == 1 ? Image.asset(AppImages.playArrowImg, scale: 3) : Container(),
                      const SizedBox(height: 70,),
                      likeShareComment()
                    ],
                  )

                ],
              ),
            ),
          );
        });
  }

  Widget profileDetails(index){
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppImages.chatProfile3Img),
              ),

              const SizedBox(width: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(petViewScreenController.postList[index].name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5),
                  const Text("2 min ago", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              )
            ],
          ),

          Container(
            height: 50,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorDarkBlue1.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer
                ),
              ],
            ),
            child: Image.asset(AppImages.threeDotImg, scale: 2),
          )

        ],
      ),
    );
  }

  Widget profileDescription(){
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
    );
  }
  
  Widget profileImage(index){
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        child: Image.asset(petViewScreenController.postList[index].image));
  }

  Widget likeShareComment(){
    return Container(
      //color: AppColors.colorDarkBlue1.withOpacity(0.6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
        color: AppColors.colorDarkBlue1.withOpacity(0.6),
      ),
      //padding: EdgeInsets.only(bottom: 50),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 45, width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.likeImg, scale: 2,),
                      const SizedBox(width: 10),
                      Text("30", style: TextStyle(color: AppColors.colorDarkBlue1),)
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Container(
                  height: 45, width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.commentImg, scale: 2,),
                      const SizedBox(width: 10),
                      Text("30", style: TextStyle(color: AppColors.colorDarkBlue1),)
                    ],
                  ),
                )
              ],
            ),

            Container(
              height: 45, width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              child: Image.asset(AppImages.shareImg, scale: 2,),
            ),
          ],
        ),
      ),
    );
  }
}
