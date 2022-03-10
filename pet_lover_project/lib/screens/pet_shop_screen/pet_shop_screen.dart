import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';

import '../../common/common_widgets.dart';
import '../../controllers/pet_shop_screen_controller/pet_shop_screen_controller.dart';
import 'pet_shop_screen_widgets.dart';

class PetShopScreen extends StatelessWidget {
  PetShopScreen({Key? key}) : super(key: key);
  final petShopScreenController = Get.put(PetShopScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              commonAppBarModule(title: 'Pet Shop'),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchFieldModule(),
                      const SizedBox(height: 20),
                      const PetAccessoriesModule(),
                      const SizedBox(height: 20),
                      const PetFoodsModule(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
