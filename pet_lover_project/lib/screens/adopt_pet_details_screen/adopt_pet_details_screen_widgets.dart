import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controllers/adopt_pet_details_screen_controller/adopt_pet_details_screen_controller.dart';

class AdoptPetDetailsBackButtonModule extends StatelessWidget {
  const AdoptPetDetailsBackButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: Image.asset(
            AppImages.backButton,
            scale: 2,
          ),
        ),
      ),
    );
  }
}

class AdoptPetImageListModule extends StatelessWidget {
  AdoptPetImageListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AdoptPetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.productImgListImg),
            // fit: BoxFit.cover
          )),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: screenController.petImageLists.length,
            options: CarouselOptions(
                height: Get.height * 0.30,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  screenController.activeIndex.value = index;
                }),
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    AssetImage(screenController.petImageLists[index]),
                  ),
                ),
              );
            },
          ),
          _indicatorModule(),
        ],
      ),
    );
  }

  Widget _indicatorModule() {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          screenController.petImageLists.length,
              (index) => screenController.activeIndex.value == index
              ? Container(
            margin: const EdgeInsets.all(4),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
          )
              : Container(
            margin: const EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }


}

class AdoptPetNamePriceAndDescriptionModule extends StatelessWidget {
  AdoptPetNamePriceAndDescriptionModule({Key? key}) : super(key: key);
  final screenController = Get.find<AdoptPetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lorem Ipsum',
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '\$60.00',
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Descriptions :',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          screenController.descriptionText,
          maxLines: 6,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class AdoptPetDetailsModule extends StatelessWidget {
  const AdoptPetDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _singleRowModule(title: 'Breed', text: 'Pekingese'),
        const SizedBox(height: 5),
        _singleRowModule(title: 'Age', text: '2 Year'),
        const SizedBox(height: 5),
        _singleRowModule(title: 'Gender', text: 'Male'),
        const SizedBox(height: 5),
        _singleRowModule(title: 'Color', text: 'Black & Ton'),
        const SizedBox(height: 5),
        _singleRowModule(title: 'Weight', text: '3 KG'),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _singleRowModule({required String title, required String text}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$title -',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class CallAndChatButtonsModule extends StatelessWidget {
  CallAndChatButtonsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AdoptPetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // _callButtonModule(),
        // const SizedBox(width: 5),
        _messageButtonModule(),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorDarkBlue1.withOpacity(0.2),
                    blurRadius: 1,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer
                ),
              ],
            ),
            child: TextFormField(
              controller: screenController.makeOfferTextFieldController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Make Offer',
                isDense: true,
                contentPadding: const EdgeInsets.all(5),
                hintStyle: TextStyle(
                  color: AppColors.colorDarkBlue1,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        _sendButton(),
      ],
    );
  }

  /*Widget _callButtonModule() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorDarkBlue1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Row(
          children: const [
            Text(
              'Call',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.phone,
              color: Colors.white,
              size: 10,
            ),
          ],
        ),
      ),
    );
  }*/

  Widget _messageButtonModule() {
    return Container(
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
    );
  }

  Widget _sendButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorDarkBlue1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Text(
          'Send',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}
