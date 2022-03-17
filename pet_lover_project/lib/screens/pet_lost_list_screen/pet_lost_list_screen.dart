import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';

import '../../controllers/pet_lost_list_screen_controller/pet_lost_list_screen_controller.dart';
import 'pet_lost_list_screen_widgets.dart';

class PetLostListScreen extends StatelessWidget {
  PetLostListScreen({Key? key}) : super(key: key);
  final petLostListScreenController = Get.put(PetLostListScreenController());

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
        ).commonPadding(),
      ),
    );
  }
}
