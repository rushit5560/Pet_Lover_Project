
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/common_functions.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controller/all_appointment_list_screen_controller/all_appointment_list_screen_controller.dart';
import '../user_details_screen/user_details_screen.dart';

class SearchFieldModule extends StatelessWidget {
  SearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<AllAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorDarkBlue1.withOpacity(0.2),
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.searchFieldController,
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
                log(screenController.searchFieldController.text);
                screenController.searchFieldController.clear();
                hideKeyboard();
              },
              child: Icon(Icons.search_rounded, color: AppColors.colorDarkBlue),
            ),
          )
      ),
    );
  }
}

class AllTabsModule extends StatelessWidget {
  AllTabsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AllAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => screenController.isAppointmentTabSelected.value = 1,
            child: Obx(
              ()=> Text(
                'All',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: screenController.isAppointmentTabSelected.value == 1
                  ? FontWeight.bold
                  : FontWeight.normal,
                  color: AppColors.colorDarkBlue1,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => screenController.isAppointmentTabSelected.value = 2,
            child: Obx(
              ()=> Text(
                'Pending',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: screenController.isAppointmentTabSelected.value == 2
                  ? FontWeight.bold
                  : FontWeight.normal,
                  color: AppColors.colorDarkBlue1,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => screenController.isAppointmentTabSelected.value = 3,
            child: Obx(
              ()=> Text(
                'Confirm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: screenController.isAppointmentTabSelected.value == 3
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: AppColors.colorDarkBlue1,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => screenController.isAppointmentTabSelected.value = 4,
            child: Obx(
              ()=> Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: screenController.isAppointmentTabSelected.value == 4
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: AppColors.colorDarkBlue1,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AllAppointmentListModule extends StatelessWidget {
  const AllAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => Get.to(()=> UserDetailsScreen(), transition: Transition.zoom),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _profilePicModule(),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Denver Ballard',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Price - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '\$20.00',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),

                                SizedBox(width: 10),

                                Text(
                                  'Time - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '\$10.00 AM',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Service - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'lorem Ipsum',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _confirmButtonModule(),

              ],
            ).commonAllSidePadding(padding: 13),
          ).commonSymmetricPadding(vertical: 8),
        );
      },
    );
  }

  Widget _profilePicModule() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppImages.chatProfile3Img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _confirmButtonModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.colorDarkBlue1,
      ),
      child: const Text(
        'Done',
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ).commonSymmetricPadding(horizontal: 16, vertical: 8),
    );
  }

}

class PendingAppointmentListModule extends StatelessWidget {
  const PendingAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => Get.to(()=> UserDetailsScreen(), transition: Transition.zoom),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _profilePicModule(),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Denver Ballard',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Price - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '\$20.00',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),

                                SizedBox(width: 10),

                                Text(
                                  'Time - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '\$10.00 AM',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Service - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'lorem Ipsum',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _confirmButtonModule(),

              ],
            ).commonAllSidePadding(padding: 13),
          ).commonSymmetricPadding(vertical: 8),
        );
      },
    );
  }

  Widget _profilePicModule() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppImages.chatProfile3Img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _confirmButtonModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.colorDarkBlue1,
      ),
      child: const Text(
        'Confirm',
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ).commonSymmetricPadding(horizontal: 16, vertical: 8),
    );
  }

}

class ConfirmAppointmentListModule extends StatelessWidget {
  const ConfirmAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 25,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => Get.to(()=> UserDetailsScreen(), transition: Transition.zoom),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _profilePicModule(),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Denver Ballard',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Price - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '\$20.00',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),

                                SizedBox(width: 10),

                                Text(
                                  'Time - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '\$10.00 AM',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Service - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'lorem Ipsum',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _confirmButtonModule(),

              ],
            ).commonAllSidePadding(padding: 13),
          ).commonSymmetricPadding(vertical: 8),
        );
      },
    );
  }

  Widget _profilePicModule() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppImages.chatProfile3Img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _confirmButtonModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.colorDarkBlue1,
      ),
      child: const Text(
        'Done',
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ).commonSymmetricPadding(horizontal: 16, vertical: 8),
    );
  }

}

class DoneAppointmentListModule extends StatelessWidget {
  const DoneAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => Get.to(()=> UserDetailsScreen(), transition: Transition.zoom),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _profilePicModule(),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Denver Ballard',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Price - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '\$20.00',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),

                                SizedBox(width: 10),

                                Text(
                                  'Time - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '\$10.00 AM',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text(
                                  'Service - ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'lorem Ipsum',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _confirmButtonModule(),

              ],
            ).commonAllSidePadding(padding: 13),
          ).commonSymmetricPadding(vertical: 8),
        );
      },
    );
  }

  Widget _profilePicModule() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppImages.chatProfile3Img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _confirmButtonModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.colorDarkBlue1,
      ),
      child: const Text(
        'Done',
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ).commonSymmetricPadding(horizontal: 16, vertical: 8),
    );
  }

}
