import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controller/blog_screen_controller/blog_screen_controller.dart';

BlogScreenController screenController = Get.find<BlogScreenController>();


class BlogScreenAppBarModule extends StatelessWidget {
  const BlogScreenAppBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Blogs',
            maxLines: 1,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          )
        ],
      ),
    );
  }
}

class MyAndPublicBlogTabModule extends StatelessWidget {
  const MyAndPublicBlogTabModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => screenController.isMyBlogSelected.value = 0,
            child: Obx(
              ()=> Text(
                'My Blog',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.colorDarkBlue1,
                  fontWeight: screenController.isMyBlogSelected.value == 0
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => screenController.isMyBlogSelected.value = 1,
            child: Obx(
              ()=> Text(
                'Public Blog',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.colorDarkBlue1,
                  fontWeight: screenController.isMyBlogSelected.value == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),),
      ],
    );
  }
}

class MyBlogListModule extends StatelessWidget {
  const MyBlogListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.chatProfile2Img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.blogCropImageContainerImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Lorem Ipsum has been  the industry's stand dummy text ever since 1500s, when as unknown printer took a gallery of type and scrambled",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            AppImages.likeImg,
                          scale: 2,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '30',
                          style: TextStyle(
                            color: AppColors.colorDarkBlue1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Image.asset(
                          AppImages.msgIconImg,
                          scale: 2.5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '30',
                          style: TextStyle(
                            color: AppColors.colorDarkBlue1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      AppImages.rightDirectionArrowImg,
                      scale: 2.75,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ).commonSymmetricPadding(horizontal: 15, vertical: 10);
      },
    );
  }

}

/// MyBlog Search Field Module
class MyBlogSearchFieldModule extends StatelessWidget {
  const MyBlogSearchFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorDarkBlue1.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.myBlogSearchFieldController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          //isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          suffixIcon: GestureDetector(
            onTap: () {
              log(screenController.myBlogSearchFieldController.text);
            },
            child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue1),
          ),
        ),
      ),
    );
  }
}


class PublicBlogListModule extends StatelessWidget {
  const PublicBlogListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.chatProfile2Img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.blogCropImageContainerImg),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: const Text(
                    "Lorem Ipsum has been  the industry's stand dummy text ever since 1500s, when as unknown printer took a gallery of type and scrambled",
                    maxLines: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11
                    ),
                  ).commonSymmetricPadding(vertical: 5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '- John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      AppImages.rightDirectionArrowImg,
                      scale: 3.5,
                    ),
                  ],
                ).commonSymmetricPadding(horizontal: 5),
              ],
            ),
          ),
        );
      },
    );
  }


}

/// Public Blog Search Field Module
class PublicBlogSearchFieldModule extends StatelessWidget {
  const PublicBlogSearchFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorDarkBlue1.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.publicBlogSearchFieldController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          //isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          suffixIcon: GestureDetector(
            onTap: () {
              log(screenController.publicBlogSearchFieldController.text);
            },
            child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue1),
          ),
        ),
      ),
    );
  }
}
