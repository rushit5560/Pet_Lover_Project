import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import '../../controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'product_details_screen_widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.put(ProductDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageListModule(),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      ProductTitleAndPriceModule(),
                      const SizedBox(height: 10),
                      ProductQtyModule(),
                      const SizedBox(height: 10),
                      ProductDescriptionModule(),
                      const SizedBox(height: 10),
                      RelatedProductsModule(),
                      const SizedBox(height: 10),
                      const AddToCartButtonModule(),
                      const SizedBox(height: 10),
                    ],
                  ).commonPadding(),
                ],
              ),
            ),
            const Positioned(
              top: 20,
              left: 20,
              child: BackButtonModule(),
            ),
          ],
        ),
      ),
    );
  }
}
