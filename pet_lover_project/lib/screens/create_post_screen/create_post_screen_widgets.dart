import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/controllers/create_post_screen_controller/create_post_screen_controller.dart';

import '../../common/constants/app_images.dart';

class CreatePostFormModule extends StatefulWidget {
  CreatePostFormModule({Key? key}) : super(key: key);

  @override
  State<CreatePostFormModule> createState() => _CreatePostFormModuleState();
}

class _CreatePostFormModuleState extends State<CreatePostFormModule> {
  final screenController = Get.find<CreatePostScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 150,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      openGallery();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //border: Border.all(color: AppColors.colorDarkBlue1),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                                  blurRadius: 8,
                                  spreadRadius: 5,
                                  blurStyle: BlurStyle.outer
                              ),
                            ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: screenController.file != null ? Image.file(screenController.file!, fit: BoxFit.fill,) :
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.addImageImg, scale: 2),
                              const SizedBox(height: 12),
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.colorDarkBlue
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //border: Border.all(color: AppColors.colorDarkBlue1),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 5,
                                blurStyle: BlurStyle.outer
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.addVideoImg, scale: 2),
                            const SizedBox(height: 12),
                            Text(
                              'Add Video',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.colorDarkBlue
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        _writeCaptionModule(),

        const SizedBox(height: 30),
        _tagPetsModule(),
        const SizedBox(height: 15),
        _radioButtonPublicModule(context),
        const SizedBox(height: 15),
        _radioButtonFriendsOnlyModule(context),
        const SizedBox(height: 15),
        _radioButtonOnlyMeModule(context),
      ],
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        screenController.file = File(image.path);
        print('Camera File Path : ${screenController.file}');
        print('Camera Image Path : ${image.path}');
        //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
        //renameImage();
      });
    } else {}
  }

  Widget _writeCaptionModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: AppColors.colorDarkBlue1),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: screenController.captionFieldController,
            maxLines: 5,
            cursorColor: AppColors.colorDarkBlue,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Write a Caption',
              hintStyle: TextStyle(
                color: AppColors.colorDarkBlue1
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget _tagPetsModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            'Tag Pets',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorDarkBlue1,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _radioButtonPublicModule(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(
        ()=> Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Public',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorDarkBlue1,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: AppColors.colorDarkBlue1
                    ),
                    child: Radio<String>(
                      value: 'public',
                      activeColor: AppColors.colorDarkBlue1,
                      groupValue: screenController.postOptionValue.value,
                      onChanged: (value) {
                        screenController.postOptionValue.value = value!;
                        print('postOption : ${screenController.postOptionValue.value}');
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _radioButtonFriendsOnlyModule(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(
            ()=> Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Friends Only',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorDarkBlue1,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: AppColors.colorDarkBlue1
                    ),
                    child: Radio<String>(
                      value: 'friendsOnly',
                      activeColor: AppColors.colorDarkBlue1,
                      groupValue: screenController.postOptionValue.value,
                      onChanged: (value) {
                        screenController.postOptionValue.value = value!;
                        print('postOption : ${screenController.postOptionValue.value}');
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _radioButtonOnlyMeModule(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(
            ()=> Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Only Me',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorDarkBlue1,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: AppColors.colorDarkBlue1
                    ),
                    child: Radio<String>(
                      value: 'onlyMe',
                      activeColor: AppColors.colorDarkBlue1,
                      groupValue: screenController.postOptionValue.value,
                      onChanged: (value) {
                        screenController.postOptionValue.value = value!;
                        print('postOption : ${screenController.postOptionValue.value}');
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
