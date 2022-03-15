import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/pet_match_screen_controller/pet_match_screen_controller.dart';

class BackButtonModule extends StatelessWidget {
  const BackButtonModule({Key? key}) : super(key: key);

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

class PetImageListModule extends StatelessWidget {
  PetImageListModule({Key? key}) : super(key: key);
  final petMatchScreenController = Get.find<PetMatchScreenController>();

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
            itemCount: petMatchScreenController.petImageLists.length,
            options: CarouselOptions(
                height: Get.height * 0.30,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  petMatchScreenController.activeIndex.value = index;
                }),
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    AssetImage(petMatchScreenController.petImageLists[index]),
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
          petMatchScreenController.petImageLists.length,
              (index) => petMatchScreenController.activeIndex.value == index
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

class PetTitleModule extends StatelessWidget {
  PetTitleModule({Key? key}) : super(key: key);
  final petMatchScreenController = Get.find<PetMatchScreenController>();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Lorem Ipsum',
      maxLines: 1,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }
}

class PetDescriptionModule extends StatelessWidget {
  PetDescriptionModule({Key? key}) : super(key: key);
  final petMatchScreenController = Get.find<PetMatchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Descriptions :',
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
        ),
        const SizedBox(height: 10),
        Text(
          petMatchScreenController.descriptionText,
          maxLines: 8,
          textAlign: TextAlign.justify,
          style: const TextStyle(
              fontSize: 12,
            color: Colors.black
          ),
        ),
      ],
    );
  }
}

class PetDetailsModule extends StatelessWidget {
  const PetDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              flex: 1,
                child: Text("Breed -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
            Expanded(
              flex: 3,
              child: Text("German Shepherd"),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: Text("Age -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
            Expanded(
              flex: 3,
              child: Text("3 Year"),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: Text("Gender -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
            Expanded(
              flex: 3,
              child: Text("Male"),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: Text("Color -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
            Expanded(
              flex: 3,
              child: Text("Black & Tan"),
            )
          ],
        ),

        const SizedBox(height: 10,),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: Text("Distance -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
            Expanded(
              flex: 3,
              child: Text("5 km"),
            )
          ],
        )
      ],
    );
  }
}

class DirectionAndMessageButtonModule extends StatelessWidget {
  const DirectionAndMessageButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32, width: Get.width/3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.colorDarkBlue1
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Get Directions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
              const SizedBox(width: 10,),
              Image.asset(AppImages.arrow, color: Colors.white, scale: 2.4,)
            ],
          ),
        ),
        const SizedBox(width: 15,),
        Container(
          height: 32, width: Get.width/3.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.colorDarkBlue1
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Message", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
              const SizedBox(width: 10,),
              //Image.asset(AppImages.arrow, color: Colors.white, scale: 1.8,)
              Icon(Icons.messenger, color: Colors.white, size: 16,)
            ],
          ),
        )
      ],
    );
  }
}

