import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/common/constants/field_decorations.dart';
import 'package:pet_lover_project/controllers/near_by_pet_services_controller/near_by_pet_services_controller.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({Key? key}) : super(key: key);

  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: false,
      //markers: _markers,
      //onCameraMove: _onCameraMove,
      initialCameraPosition: _kGooglePlex,
      zoomGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}


class SearchFieldModule extends StatelessWidget {
  SearchFieldModule({Key? key}) : super(key: key);
  final nearByPetSerrvicesScreenController = Get.find<NearByPetServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: TextFormField(
       // controller: screenController.searchTextFieldController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          suffixIcon: GestureDetector(
            onTap: () {
              print(nearByPetSerrvicesScreenController.searchTextFieldController.text);
            },
            child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue),
          ),
        )
      ),
    );
  }
}

class PetServicesModule extends StatelessWidget {
  PetServicesModule({Key? key}) : super(key: key);
  final nearByPetSerrvicesScreenController = Get.find<NearByPetServicesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getDirectionsButton(),
        const SizedBox(height: 20),
        Row(
          children: [
            GestureDetector(
                onTap: () {nearByPetSerrvicesScreenController.petServicePreviousClick(pageController: nearByPetSerrvicesScreenController.servicePageController);},
                child: const LeftArrowButtonModule()),
            Expanded(
              child: SizedBox(
                height: 180,
                child: PageView.builder(
                  padEnds: false,
                  controller: nearByPetSerrvicesScreenController.servicePageController,
                  onPageChanged: nearByPetSerrvicesScreenController.selectedPageIndex,
                  itemCount: nearByPetSerrvicesScreenController.serviceLists.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                      },
                      child: Padding(
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
                                        padding: const EdgeInsets.all(3),
                                        child: Column(
                                          children: [
                                            const Text(
                                              '1547, lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                              maxLines: 2,
                                              style: TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.w500),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Distance - ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                                ),
                                                Text('2.5 Km', style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),),
                                              ],
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Time - ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                                ),
                                                Text('12min', style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),),
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
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
                onTap: () {nearByPetSerrvicesScreenController.petServiceNextClick(pageController: nearByPetSerrvicesScreenController.servicePageController);},
                child: const RightArrowButtonModule()),
          ],
        ),
      ],
    );
  }

  Widget getDirectionsButton() {
    return Container(
      height: 45, width: Get.width/2.5,
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.colorDarkBlue1
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Get Directions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(width: 10,),
          Image.asset(AppImages.arrow, color: Colors.white, scale: 1.8,)
        ],
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