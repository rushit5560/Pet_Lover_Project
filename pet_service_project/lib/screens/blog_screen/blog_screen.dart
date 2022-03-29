import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/enums.dart';
import '../../common/custom_appbar/custom_appbar.dart';
import '../../controller/blog_screen_controller/blog_screen_controller.dart';
import 'blog_screen_widgets.dart';

class BlogScreen extends StatelessWidget {
  BlogScreen({Key? key}) : super(key: key);
  final blogScreenController = Get.put(BlogScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BlogScreenAppBarModule(),
            const SizedBox(height: 35),
            const MyAndPublicBlogTabModule(),
            const SizedBox(height: 25),
            Obx(
                () => blogScreenController.isMyBlogSelected.value == 0
                    ? const MyBlogSearchFieldModule()
                    : const PublicBlogSearchFieldModule()
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Obx(
                ()=> blogScreenController.isMyBlogSelected.value == 0
                ? const MyBlogListModule()
                : const PublicBlogListModule(),
              ),
            ),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
