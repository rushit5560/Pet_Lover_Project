import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import '../../../common/constants/app_images.dart';
import '../../../controllers/user_profile_screen_controller/user_profile_screen_controller.dart';


class BackGroundImageModule extends StatelessWidget {
  const BackGroundImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.37,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppImages.productImgListImg),
        // fit: BoxFit.cover
      )),
    );
  }
}

class ProfileInfoModule extends StatelessWidget {
  const ProfileInfoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.width * 0.30,
          width: Get.width * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            image: const DecorationImage(
              image: AssetImage(AppImages.chatProfile3Img),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Denver Ballard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _counterModule(count: '30', name: 'Following')),
              const SizedBox(width: 5),
              Expanded(child: _counterModule(count: '400', name: 'Likes')),
              const SizedBox(width: 5),
              Expanded(child: _counterModule(count: '458', name: 'Followers')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _counterModule({required String count, required String name}) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class FollowAndChatButton extends StatelessWidget {
  const FollowAndChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.colorDarkBlue1,
                borderRadius: BorderRadius.circular(15)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Text(
                'Follow',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 35),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: AppColors.colorDarkBlue1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 5,
                      spreadRadius: 5,
                      blurStyle: BlurStyle.outer
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(AppImages.msgIconImg, scale: 2),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoAndVideoTabModule extends StatelessWidget {
  PhotoAndVideoTabModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        ()=> Column(
          children: [
            Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        screenController.isPhotoViewSelected.value = !screenController.isPhotoViewSelected.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Photos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: screenController.isPhotoViewSelected.value ? FontWeight.bold : null,
                            color: AppColors.colorDarkBlue1,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        screenController.isPhotoViewSelected.value = !screenController.isPhotoViewSelected.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Videos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: screenController.isPhotoViewSelected.value ? null : FontWeight.bold,
                            color: AppColors.colorDarkBlue1,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),
            Container(
                child: screenController.isPhotoViewSelected.value
                    ? _photoViewModule()
                    : _videoViewModule(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _photoViewModule() {
    /*return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(20, (index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            // height: Get.width,
            // width: Get.width,
            // child: Image.asset(AppImages.chatProfile1Img, fit: BoxFit.cover),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AppImages.chatProfile1Img),
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
          ),
        );
      }),
    );*/
    return GridView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(AppImages.chatProfile1Img),
            ),
          ),
        );
      },
    );
  }

  Widget _videoViewModule() {
    return GridView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(AppImages.chatProfile2Img),
            ),
          ),
        );
      },
    );
  }

}
