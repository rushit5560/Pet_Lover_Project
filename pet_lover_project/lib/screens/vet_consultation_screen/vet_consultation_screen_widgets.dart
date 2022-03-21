import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/vet_consultation_screen_controller/vet_consultation_screen_controller.dart';
import 'package:pet_lover_project/screens/vet_details_screen/vet_details_screen.dart';

class SearchVetConsultationTextField extends StatelessWidget {
  SearchVetConsultationTextField({Key? key}) : super(key: key);

  final vetConsultationScreenController = Get.find<VetConsultationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                blurStyle: BlurStyle.outer
            )
          ]
      ),
      child: TextFormField(
        controller: vetConsultationScreenController.searchTextFieldController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
          border: InputBorder.none,
          //isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          suffixIcon: GestureDetector(
            onTap: () {
              print(vetConsultationScreenController.searchTextFieldController.text);
            },
            child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue1),
          ),
        ),
      ),
    );
  }
}

class VetConsultationList extends StatelessWidget {
  VetConsultationList({Key? key}) : super(key: key);

  final vetConsultationScreenController = Get.find<VetConsultationScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: vetConsultationScreenController.vetChat.length,
      itemBuilder: (context, index) {
        return Container(
          //padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.only(bottom: 25, left: 15, right: 15, top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 5,
                blurStyle: BlurStyle.outer
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                          flex:1,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height: 80, width: 80,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex:15,
                                      child: Container()),
                                  Expanded(
                                    flex: 85,
                                    child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: AppColors.colorDarkBlue1
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(vetConsultationScreenController.vetChat[index].image),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(vetConsultationScreenController.vetChat[index].name, maxLines:1, style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16
                            ),),
                            const SizedBox(height: 5),
                            Text(vetConsultationScreenController.vetChat[index].specialist, maxLines:1, style: const TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14
                            ),),
                            const SizedBox(height: 5),
                            Text(vetConsultationScreenController.vetChat[index].experience, maxLines:1,style: const TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w600 ,fontSize: 12
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Get.to(()=> const VetDetailsScreen(), transition: Transition.zoom),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.colorDarkBlue1
                      ),
                      child: const Center(
                        child: Text("View", style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
