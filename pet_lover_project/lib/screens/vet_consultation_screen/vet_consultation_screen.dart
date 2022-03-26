import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/vet_consultation_screen_controller/vet_consultation_screen_controller.dart';
import 'package:pet_lover_project/screens/vet_consultation_screen/vet_consultation_screen_widgets.dart';

class VetConsultationScreen extends StatelessWidget {
  VetConsultationScreen({Key? key}) : super(key: key);

  final vetConsultationScreenController = Get.put(VetConsultationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBarModule(title: 'Vet List', appBarOption: AppBarOption.backButtonScreenOption),

            SizedBox(height: 40,),

            SearchVetConsultationTextField(),
            SizedBox(height: 25,),
            Expanded(
              child: VetConsultationList(),
            )

          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
