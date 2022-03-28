import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controller/home_screen_controller/home_screen_controller.dart';

class AppointmentTabsModule extends StatelessWidget {
  AppointmentTabsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _pendingAppointmentModule()),
        const SizedBox(width: 18),
        Expanded(child: _confirmAppointmentModule()),
      ],
    );
  }

  Widget _pendingAppointmentModule() {
    return GestureDetector(
      onTap: () => screenController.isPendingAppointmentSelected.value = 1,
      child: Obx(
        ()=> Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: screenController.isPendingAppointmentSelected.value == 1
                  ? AppColors.colorDarkBlue1
                  : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 80,
                  child: Image.asset(
                    AppImages.pendingAppointmentImg,
                    // fit: BoxFit.fill,
                    scale: 2,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 20,
                  child: Center(
                    child: Text(
                      'Pending Appointment',
                      maxLines: 1,
                      style: TextStyle(
                        color: screenController.isPendingAppointmentSelected.value == 1
                        ? Colors.white
                        : AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ).commonSymmetricPadding(horizontal: 10, vertical: 10),
          ),
        ),
      ),
    );
  }

  Widget _confirmAppointmentModule() {
    return GestureDetector(
      onTap: () => screenController.isPendingAppointmentSelected.value = 2,
      child: Obx(
        ()=> Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: screenController.isPendingAppointmentSelected.value == 2
                  ? AppColors.colorDarkBlue1
                  : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 80,
                  child: Image.asset(
                    AppImages.confirmAppointmentImg,
                    // fit: BoxFit.fill,
                    scale: 2,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 20,
                  child: Center(
                    child: Text(
                      'Confirm Appointment',
                      maxLines: 1,
                      style: TextStyle(
                        color: screenController.isPendingAppointmentSelected.value == 2
                            ? Colors.white
                            : AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ).commonSymmetricPadding(horizontal: 10, vertical: 10),
          ),
        ),
      ),
    );
  }
}

class PendingAppointmentListModule extends StatelessWidget {
  const PendingAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
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
        ).commonSymmetricPadding(vertical: 8);
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
      itemCount: 6,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
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
        ).commonSymmetricPadding(vertical: 8);
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


