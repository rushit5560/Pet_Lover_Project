import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/controllers/near_by_pet_services_controller/near_by_pet_services_controller.dart';
import 'package:pet_lover_project/screens/near_by_pet_services_screen/near_by_pet_services_widgets.dart';

class NearByPetServicesScreen extends StatelessWidget {
  NearByPetServicesScreen({Key? key}) : super(key: key);

  final nearByPetSerrvicesScreenController = Get.put(NearByPetServicesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMapView(),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CommonAppBarModule(title: 'Pet Services', appBarOption: AppBarOption.backButtonScreenOption),
                        SizedBox(height: 30),

                        SearchFieldModule(),
                      ],
                    ),

                    PetServicesModule(),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
