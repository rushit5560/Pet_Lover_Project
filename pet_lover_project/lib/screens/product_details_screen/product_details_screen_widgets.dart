import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/screens/cart_screen/cart_screen.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/app_images.dart';
import '../../controllers/product_details_screen_controller/product_details_screen_controller.dart';

class ProductImageListModule extends StatelessWidget {
  ProductImageListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProductDetailsScreenController>();

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
            itemCount: screenController.productImageLists.length,
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
                        AssetImage(screenController.productImageLists[index]),
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
          screenController.productImageLists.length,
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

class ProductTitleAndPriceModule extends StatelessWidget {
  ProductTitleAndPriceModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProductDetailsScreenController>();

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
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 5),
        RatingBar.builder(
          itemCount: 5,
          unratedColor: AppColors.colorLightOrange,
          allowHalfRating: true,
          itemSize: 22,
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
        const SizedBox(height: 5),
        Row(
          children: [
            const Text(
              '\$20.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '\$25.00',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.colorMenuLightBlue,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProductQtyModule extends StatelessWidget {
  ProductQtyModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'QTY :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 5),
        _decButton(),
        const SizedBox(width: 5),
        Obx(
          ()=> Container(
            alignment: Alignment.center,
            width: 23,
            child: Text(
              '${screenController.productItemQty.value}',
              style: const  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        _incButton(),
      ],
    );
  }

  Widget _decButton() {
    return GestureDetector(
      onTap: () {
        screenController.productItemQty.value -= 1;
      },
      child: Container(
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(Icons.remove, color: Colors.white, size: 18),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkBlue1
        ),
      ),
    );
  }

  Widget _incButton() {
    return GestureDetector(
      onTap: () {
        screenController.productItemQty.value += 1;
      },
      child: Container(
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(Icons.add_rounded, color: Colors.white, size: 18),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkBlue1
        ),
      ),
    );
  }
}

class ProductDescriptionModule extends StatelessWidget {
  ProductDescriptionModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProductDetailsScreenController>();

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
          screenController.descriptionText,
          maxLines: 8,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 12
          ),
        ),
      ],
    );
  }
}

class RelatedProductsModule extends StatelessWidget {
  RelatedProductsModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        _relatedProductsListModule(),
      ],
    );
  }

  Widget _relatedProductsListModule() {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              screenController.relatedProductPreviousClick(pageController: screenController.relatedPageController);
            },
            child: const LeftArrowButtonModule()),
        Expanded(
          child: SizedBox(
            height: 160,
            child: PageView.builder(
              padEnds: false,
              controller: screenController.relatedPageController,
              onPageChanged: screenController.selectedRelatedIndex,
              itemCount: screenController.relatedProductList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 80,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 60,
                                      child: Container(
                                        width: Get.width,
                                        height: Get.height,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: AppColors.colorDarkBlue1,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(screenController.relatedProductList[index]),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      flex: 40,
                                      child: Column(
                                        children: const [
                                          Text(
                                            'Lorem Ipsum',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Text(
                                            '\$20.00',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -15,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.colorDarkBlue1,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Icon(Icons.add_rounded, color: Colors.white, size: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              screenController.relatedProductNextClick(pageController: screenController.relatedPageController);
            },
            child: const RightArrowButtonModule()),
      ],
    );
  }
}

class AddToCartButtonModule extends StatelessWidget {
  const AddToCartButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> CartScreen(), transition: Transition.zoom),
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkBlue1
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              'ADD TO CART',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
