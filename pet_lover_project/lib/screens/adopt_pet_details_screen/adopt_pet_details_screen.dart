import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/adopt_pet_details_screen_controller/adopt_pet_details_screen_controller.dart';
import 'adopt_pet_details_screen_widgets.dart';

class AdoptPetDetailsScreen extends StatelessWidget {
  AdoptPetDetailsScreen({Key? key}) : super(key: key);
  final adoptPetDetailsScreenController = Get.put(AdoptPetDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                AdoptPetImageListModule(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdoptPetNamePriceAndDescriptionModule(),
                      const SizedBox(height: 15),
                      AdoptPetDetailsModule(),
                      const SizedBox(height: 10),
                      CallAndChatButtonsModule(),

                    ],
                  ),
                ),
              ],
            ),

            const Positioned(
              top: 20,
              left: 20,
              child: AdoptPetDetailsBackButtonModule(),
            ),
          ],
        ),
      ),
    );
  }
}
