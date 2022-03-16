import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import '../../common/constants/enums.dart';
import '../../controllers/create_post_screen_controller/create_post_screen_controller.dart';
import 'create_post_screen_widgets.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({Key? key}) : super(key: key);
  final createPostScreenController = Get.put(CreatePostScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              CommonAppBarModule(title: 'Create Post', appBarOption: AppBarOption.createPostOption),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreatePostFormModule(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
