import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';

import 'vet_details_screen_widgets.dart';

class VetDetailsScreen extends StatelessWidget {
  const VetDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              // alignment: Alignment.bottomLeft,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const VetImageModule(),
                      // const SizedBox(height: 20),

                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          VetNameAndSpecialistModule(),
                          SizedBox(height: 15),
                          AddressAndTimeModule(),
                        ],
                      ).commonPadding(),
                    ],
                  ),
                ),


                const Positioned(
                  top: 20,
                  left: 20,
                  child: VetDetailsBackButtonModule(),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BookAppointmentAndMessageModule(),
            ),
          ],
        ),
      ),
    );
  }
}
