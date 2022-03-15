import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/constants/field_decorations.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';

class HomeSearchFieldModule extends StatelessWidget {
  HomeSearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: AppColors.colorLightBlue,
      child: TextFormField(
        controller: screenController.searchTextFieldController,
        keyboardType: TextInputType.text,
        decoration: searchFieldDecorationHomeScreen(screenController),
      ),
    );
  }
}

class PetShopModule extends StatelessWidget {
  const PetShopModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _petShopHeading(),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            itemCount: 2,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.35,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(AppImages.shop1Img, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Expanded(
                        flex: 20,
                        child: Text(
                            'Pet Accessories',
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _petShopHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Pet Shop',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    AppImages.cartImg,
                    scale: 1.6,
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    AppImages.shoppingBagImg,
                    scale: 2,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PetServicesModule extends StatelessWidget {
  PetServicesModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _petServiceHeading(),
        const SizedBox(height: 20),
        Row(
          children: [
            GestureDetector(
                onTap: () {screenController.petServicePreviousClick(pageController: screenController.servicePageController);},
                child: const LeftArrowButtonModule()),
            Expanded(
              child: SizedBox(
                height: 180,
                child: PageView.builder(
                  padEnds: false,
                  controller: screenController.servicePageController,
                  onPageChanged: screenController.selectedPageIndex,
                  itemCount: screenController.serviceLists.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            // alignment: Alignment.bottomRight,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    flex: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: const DecorationImage(
                                            image: AssetImage(AppImages.service1Img),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Column(
                                        children: [
                                          const Text(
                                            '1547, lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 10),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            children: const [
                                              Text(
                                                'Distance - ',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                              ),
                                              Text('2.5 Km', style: TextStyle(fontSize: 10),),
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            children: const [
                                              Text(
                                                'Time - ',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                              ),
                                              Text('12min', style: TextStyle(fontSize: 10),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Image.asset(AppImages.arrow, scale: 1.8),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
                onTap: () {screenController.petServiceNextClick(pageController: screenController.servicePageController);},
                child: const RightArrowButtonModule()),
          ],
        ),
        const SizedBox(height: 15),
        _seeMoreModule(),
      ],
    );
  }

  Widget _petServiceHeading() {
    return const Text(
      'Find Near By Pet Services',
      maxLines: 1,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _seeMoreModule() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorDarkBlue1,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            'See More',
            style: TextStyle(color: AppColors.colorLightBlue),
          ),
        ),
      ),
    );
  }
}

class ReminderContainerModule extends StatelessWidget {
  const ReminderContainerModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: Get.width,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(AppImages.reminderImg),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Set Your Reminder',
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // const SizedBox(height: 10),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and type',
                            maxLines: 2,
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(10),
                child: Image.asset(AppImages.arrow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PetMatchModule extends StatelessWidget {
  PetMatchModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _petMatchHeading(),
        const SizedBox(height: 20),
        Row(
          children: [
            GestureDetector(
                onTap: () {screenController.petServicePreviousClick(pageController: screenController.matchPageController);},
                child: const LeftArrowButtonModule()),
            Expanded(
              child: SizedBox(
                height: 140,
                child: PageView.builder(
                  padEnds: false,
                  controller: screenController.matchPageController,
                  onPageChanged: screenController.selectedPetMatchIndex,
                  itemCount: screenController.petMatchList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.colorDarkBlue.withOpacity(1.0),
                                      ),
                                    ]
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 60,
                                        child: Container(
                                          width: Get.width,
                                          height: Get.height,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: AppColors.colorDarkBlue1,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Image.asset(screenController.petMatchList[index]),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Expanded(
                                        flex: 40,
                                        child: Text(
                                            'Lorem Ipsum',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: -15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: AppColors.colorDarkBlue1,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      child: Text(
                                        'View',
                                        style: TextStyle(
                                            color: Colors.white,
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: Container(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
                onTap: () {screenController.petServiceNextClick(pageController: screenController.matchPageController);},
                child: const RightArrowButtonModule()),
          ],
        ),
      ],
    );
  }

  Widget _petMatchHeading() {
    return const Text(
      'Find Near By Pet Match',
      maxLines: 1,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

}
