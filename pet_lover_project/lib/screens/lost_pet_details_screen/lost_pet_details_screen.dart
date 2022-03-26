import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';

import '../../controllers/lost_pet_details_screen_controller/lost_pet_details_screen_controller.dart';
import 'lost_pet_details_screen_widgets.dart';


class LostPetDetailsScreen extends StatelessWidget {
  LostPetDetailsScreen({Key? key}) : super(key: key);
  final lostPetDetailsScreenController = Get.put(LostPetDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'Lost Pet Details', appBarOption: AppBarOption.backButtonScreenOption),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LostPetImagesListModule(),
                    const SizedBox(height: 20),
                    LostPetImagesIndicatorModule(),
                    const SizedBox(height: 20),
                    PetNameAndDescriptionModule(),
                    const SizedBox(height: 20),
                    const LostPetDetailsModule(),
                    const SizedBox(height: 20),
                    const MessageAndFoundButtonModule(),
                  ],
                ),
              ),
            ),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
