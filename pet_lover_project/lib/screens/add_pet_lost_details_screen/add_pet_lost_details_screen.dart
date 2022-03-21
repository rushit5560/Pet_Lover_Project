import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/add_pet_lost_details_screen_controller/add_pet_lost_details_screen_controller.dart';
import 'package:pet_lover_project/screens/add_pet_lost_details_screen/add_pet_lost_details_screen_widgets.dart';

class AddPetLostDetailsScreen extends StatelessWidget {
  AddPetLostDetailsScreen({Key? key}) : super(key: key);

  final addPetLostDetailsScreenController = Get.put(AddPetLostDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonAppBarModule(title: 'Add Details', appBarOption: AppBarOption.backButtonScreenOption),

            SizedBox(height: 30,),

            Expanded(
                child: AddPetLostDetailsForm())
          ],
        ).commonPadding(),
      ),
    );
  }
}
