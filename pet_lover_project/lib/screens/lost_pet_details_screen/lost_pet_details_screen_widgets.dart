import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../controllers/lost_pet_details_screen_controller/lost_pet_details_screen_controller.dart';

class LostPetImagesListModule extends StatelessWidget {
  LostPetImagesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<LostPetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.list.length,
      options: CarouselOptions(
          height: Get.height * 0.30,
          // autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            screenController.activeIndex.value = index;
          }),
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:
                AssetImage(screenController.list[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class LostPetImagesIndicatorModule extends StatelessWidget {
  LostPetImagesIndicatorModule({Key? key}) : super(key: key);
  final screenController = Get.find<LostPetDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          screenController.list.length,
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

class PetNameAndDescriptionModule extends StatelessWidget {
  PetNameAndDescriptionModule({Key? key}) : super(key: key);
  final screenController = Get.find<LostPetDetailsScreenController>();

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
        _dateAndPlaceModule(text: 'Last Date - ', value: '15/03/2022'),
        const SizedBox(height: 10),
        _dateAndPlaceModule(text: 'Last At - ', value: 'Baybush'),
        const SizedBox(height: 10),
        const Text(
          'Descriptions :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          screenController.descriptionText,
          maxLines: 4,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Widget _dateAndPlaceModule({required String text, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

}

class LostPetDetailsModule extends StatelessWidget {
  const LostPetDetailsModule({Key? key}) : super(key: key);

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

class MessageAndFoundButtonModule extends StatelessWidget {
  const MessageAndFoundButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _messageButtonModule(),
        const SizedBox(width: 20),
        _foundButtonModule(),
      ],
    );
  }

  Widget _messageButtonModule() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: const [
              Text(
                'Message',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.message,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _foundButtonModule() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'I Found Him/her',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
