import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import '../../common/custom_appbar/custom_appbar.dart';
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
        child: Column(
          children: [
            CommonAppBarModule(title: 'Pet Shop', appBarOption: AppBarOption.petShopScreenOption),
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
        ).commonAllSidePadding(),
      ),
    );
  }
}
