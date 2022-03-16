import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/controllers/pet_view_screen_controller/pet_view_screen_controller.dart';
import 'package:pet_lover_project/screens/pet_view_screen/pet_view_screen_widgets.dart';

class PetViewScreen extends StatelessWidget {
  PetViewScreen({Key? key}) : super(key: key);

  final petViewScreenController = Get.put(PetViewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CommonAppBarModule(title: 'Pet View', appBarOption: AppBarOption.petViewScreenOption),
              const SizedBox(height: 40,),
              AddPhoto(),
              const SizedBox(height: 25,),
              Expanded(
                  child: PetPostList())
            ],
          ),
        ),
      ),
    );
  }
}
