import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/screens/conversation_screen/conversation_screen.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controller/user_details_screen_controller/user_details_screen_controller.dart';


class UserDetailsBackButtonModule extends StatelessWidget {
  UserDetailsBackButtonModule({Key? key}) : super(key: key);
  final userDetailsScreenController = Get.find<UserDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),

        child: Image.asset(
          AppImages.backButtonImg,
          scale: 2,
        ),
      ),
    );
  }
}

class UserProfileModule extends StatelessWidget {
  const UserProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.productImgListImg),
            fit: BoxFit.cover,
            // fit: BoxFit.cover
          )),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.width * 0.50,
            width: Get.width * 0.50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.chatProfile3Img),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserNameModule extends StatelessWidget {
  const UserNameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Denver Ballard',
      maxLines: 1,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }
}

class UserServiceModule extends StatelessWidget {
  const UserServiceModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Service - ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        Expanded(
          child: Text(
            'Lorem Ipsum',
            maxLines: 1,
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ],
    );
  }
}

class UserPriceModule extends StatelessWidget {
  const UserPriceModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 25,
          child: Text(
            'Price - ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ),
        Expanded(
          flex: 75,
          child: Text(
            '\$20.00',
            maxLines: 1,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ],
    );
  }
}

class UserTimeModule extends StatelessWidget {
  const UserTimeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 25,
          child: Text(
            'Time - ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ),
        Expanded(
          flex: 75,
          child: Text(
            '10:00 AM',
            maxLines: 1,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ],
    );
  }
}

class UserDescriptionModule extends StatelessWidget {
  const UserDescriptionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting "
          "industry. Lorem Ipsum has been the industry's standard dummy text "
          "ever since the 1500s, when an unknown printer took a galley of type "
          "and scrambled it to make a type specimen book. It has survived "
          "not only five centuries, but also the leap into electronic "
          "typesetting, remaining essentially unchanged. It was popularised "
          "in the 1960s with the release of Letraset sheets containing Lorem "
          "Ipsum passages, and more recently with desktop publishing software "
          "like Aldus PageMaker including versions of Lorem Ipsum.",
      maxLines: 7,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(),
    );
  }
}

class MessageButtonModule extends StatelessWidget {
  const MessageButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> ConversationScreen(), transition: Transition.zoom),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Row(
            children: const [
              Text(
                'Message',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.message,
                color: Colors.white,
                size: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmButtonModule extends StatelessWidget {
  const ConfirmButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Row(
            children: const [
              Text(
                'Confirm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.message,
                color: Colors.white,
                size: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



