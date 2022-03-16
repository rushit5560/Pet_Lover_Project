import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/adopt_pet_screen_controller/adopt_pet_screen_controller.dart';

class SearchChatTextField extends StatelessWidget {
  SearchChatTextField({Key? key}) : super(key: key);

  final adoptPetScreenController = Get.find<AdoptPetScreenController>();

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
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                blurStyle: BlurStyle.outer
            )
          ]
      ),
      child: TextFormField(
        controller: adoptPetScreenController.searchTextFieldController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          //isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          suffixIcon: GestureDetector(
            onTap: () {
              print(adoptPetScreenController.searchTextFieldController.text);
            },
            child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue1),
          ),
        ),
      ),
    );
  }
}

class AdoptPetGridList extends StatelessWidget {
  AdoptPetGridList({Key? key}) : super(key: key);

  final adoptPetScreenController = Get.find<AdoptPetScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: adoptPetScreenController.adoptPetList.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, i) {
        return adoptPetGridList(i);
      },
    );
  }


  Widget adoptPetGridList(i){
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
            height: Get.height/6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorDarkBlue1
              ),
              child: Image.asset(adoptPetScreenController.adoptPetList[i],scale: 6,),
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Lorem Ipsum", maxLines: 1,
                          style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 4,),
                        Text("\$60.00",style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40, width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.colorDarkBlue1
                      ),
                      child: Center(
                        child: Text("View", style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
