import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/controllers/add_details_screen_controller/add_details_screen_controller.dart';
import 'package:pet_lover_project/screens/add_details_screen/add_details_screen_widgets.dart';

class AddDetailsScreen extends StatelessWidget {
  AddDetailsScreen({Key? key}) : super(key: key);

  final addDetailsScreenController = Get.put(AddDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonAppBarModule(title: 'Add Details', appBarOption: AppBarOption.backButtonScreenOption),

              SizedBox(height: 30,),

              Expanded(
                  child: AddDetailsForm())
            ],
          ),
        ),
      ),
    );
  }
}
