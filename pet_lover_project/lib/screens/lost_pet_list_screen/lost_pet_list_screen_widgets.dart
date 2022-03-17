import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_functions.dart';
import 'package:pet_lover_project/controllers/lost_pet_list_screen_controller/lost_pet_list_screen_controller.dart';
import '../../common/constants/app_colors.dart';

class PetLostListSearchFieldModule extends StatelessWidget {
  PetLostListSearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<LostPetListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: AppColors.colorDarkBlue1.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 2,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: TextFormField(
        controller: screenController.searchFieldController,
        cursorColor: AppColors.colorDarkBlue1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              hideKeyboard();
            },
            child: Icon(
              Icons.search,
              color: AppColors.colorDarkBlue1,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}

class PetLostListsModule extends StatelessWidget {
  PetLostListsModule({Key? key}) : super(key: key);
  final screenController = Get.find<LostPetListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.petLostList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, i) {
        return Column(
          children: [
            Expanded(
              flex: 9,
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.colorDarkBlue1.withOpacity(0.2),
                            blurRadius: 1,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.outer),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image:
                                    AssetImage(screenController.petLostList[i]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Lorem Ipsum',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Text(
                                      'Last Date - ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '12/03/2022',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Text(
                                      'Last At - ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Belwall',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    child: GestureDetector(
                      onTap: () => print('View'),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.colorDarkBlue1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 7),
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: AppColors.colorLightBlue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        );
      },
    );
  }
}
