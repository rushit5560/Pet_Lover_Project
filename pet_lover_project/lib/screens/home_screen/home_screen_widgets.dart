import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        SizedBox(
          height: 210,
          child: PageView.builder(
            padEnds: false,
            controller: screenController.servicePage,
            onPageChanged: screenController.selectedPageIndex,
            itemCount: screenController.serviceLists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 70,
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
                              flex: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    const Text(
                                      '1547, lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Distance - ',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        Text('2.5 Km', style: TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Time - ',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        Text('12min', style: TextStyle(fontSize: 12),),
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
                        // bottom: 50,
                        // right: 20,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.rightDirectionArrowImg),
                              scale: 2.5,
                            )
                          ),
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
}
