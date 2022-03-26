import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/lost_pet_list_screen_controller/lost_pet_list_screen_controller.dart';

import 'lost_pet_list_screen_widgets.dart';

class LostPetListScreen extends StatelessWidget {
  LostPetListScreen({Key? key}) : super(key: key);
  final lostPetListScreenController = Get.put(LostPetListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'Pet Lost List', appBarOption: AppBarOption.petLostListScreen),
            const SizedBox(height: 40),
            PetLostListSearchFieldModule(),
            const SizedBox(height: 20),
            Expanded(
              child: PetLostListsModule(),
            ),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
