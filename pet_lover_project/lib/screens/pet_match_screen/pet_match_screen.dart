import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/pet_match_screen_controller/pet_match_screen_controller.dart';
import 'package:pet_lover_project/screens/pet_match_screen/pet_match_screen_widgets.dart';

class PetMatchScreen extends StatelessWidget {
  PetMatchScreen({Key? key}) : super(key: key);

  final petMatchScreenController =
  Get.put(PetMatchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PetImageListModule(),
                  const SizedBox(height: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PetTitleModule(),
                      const SizedBox(height: 10),
                      PetDescriptionModule(),
                      const SizedBox(height: 10),
                      const PetDetailsModule(),
                      const SizedBox(height: 20),
                      const DirectionAndMessageButtonModule()
                    ]
                  ).commonAllSidePadding(),

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
