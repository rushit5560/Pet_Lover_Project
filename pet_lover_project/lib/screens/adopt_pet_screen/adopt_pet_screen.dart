import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/controllers/adopt_pet_screen_controller/adopt_pet_screen_controller.dart';
import 'package:pet_lover_project/screens/adopt_pet_screen/adopt_pet_screen_widgets.dart';

class AdoptPetScreen extends StatelessWidget {
  AdoptPetScreen({Key? key}) : super(key: key);

  final adoptPetScreenController = Get.put(AdoptPetScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CommonAppBarModule(title: 'Adopt Pet', appBarOption: AppBarOption.adoptPetScreenOption),
              SizedBox(height: 35,),

              SearchChatTextField(),
              SizedBox(height: 25,),

              Expanded(child: AdoptPetGridList())
            ],
          ),
        ),
      ),
    );
  }
}
