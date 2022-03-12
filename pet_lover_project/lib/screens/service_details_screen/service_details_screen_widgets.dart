import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controllers/service_details_screen_controller/service_details_screen_controller.dart';

class ServiceImageListModule extends StatelessWidget {
  ServiceImageListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ServiceDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.30,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.productImgListImg),
            // fit: BoxFit.cover
          )),
      child: CarouselSlider.builder(
        itemCount: screenController.serviceImageLists.length,
        options: CarouselOptions(
            height: Get.height * 0.30,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              screenController.activeIndex.value = index;
            }),
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image:
                  AssetImage(screenController.serviceImageLists[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ServiceImageListIndicatorModule extends StatelessWidget {
  ServiceImageListIndicatorModule({Key? key}) : super(key: key);
  final screenController = Get.find<ServiceDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          screenController.serviceImageLists.length,
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

class ProductnameAndDescriptionModule extends StatelessWidget {
  ProductnameAndDescriptionModule({Key? key}) : super(key: key);
  final screenController = Get.find<ServiceDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lorem Ipsum',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '4.8',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              RatingBar.builder(
                itemCount: 5,
                unratedColor: AppColors.colorLightOrange,
                allowHalfRating: true,
                itemSize: 24,
                minRating: 0,
                glow: false,
                initialRating: 4,
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star_rounded,
                    color: AppColors.colorOrange,
                  );
                },
                onRatingUpdate: (value){},
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            screenController.descriptionText,
            maxLines: 8,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                fontSize: 12,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

class AddressModule extends StatelessWidget {
  const AddressModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _singleModule(title: 'Address', value: '1547, Lorem Ipsum is simply dummy text of the printing typesetting industry'),
          const SizedBox(height: 5),
          _singleModule(title: 'Call', value: '1234567890'),
          const SizedBox(height: 5),
          _singleModule(title: 'Time', value: '12 min'),
          const SizedBox(height: 5),
          _singleModule(title: 'Distance', value: '2.5 km'),
        ],
      ),
    );
  }

  Widget _singleModule({required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 25,
          child: Text(
            title,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 75,
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class DirectionAndShareModule extends StatelessWidget {
  const DirectionAndShareModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.colorDarkBlue1
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              child: Row(
                children: const [
                  Text(
                    'Get Directions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(width: 25),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colorDarkBlue1
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              child: Row(
                children: const [
                  Text(
                    'Share',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.share, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
