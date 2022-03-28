import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/enums.dart';
import '../../common/custom_appbar/custom_appbar.dart';
import '../../controller/all_appointment_list_screen_controller/all_appointment_list_screen_controller.dart';
import 'all_appointment_list_screen_widgets.dart';


class AllAppointmentListScreen extends StatelessWidget {
  AllAppointmentListScreen({Key? key}) : super(key: key);
  final allAppointmentListScreenController = Get.put(AllAppointmentListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: "", appBarOption: AppBarOption.allAppointmentListScreenOption),
            const SizedBox(height: 35),
            SearchFieldModule(),
            const SizedBox(height: 25),
            AllTabsModule(),
            const SizedBox(height: 15),
            Obx(
              () => Expanded(
                child: allAppointmentListScreenController.isAppointmentTabSelected.value == 1
                    ? const AllAppointmentListModule()
                    : allAppointmentListScreenController.isAppointmentTabSelected.value == 2
                        ? const PendingAppointmentListModule()
                        : allAppointmentListScreenController.isAppointmentTabSelected.value == 3
                            ? const ConfirmAppointmentListModule()
                            : allAppointmentListScreenController.isAppointmentTabSelected.value == 4
                                ? const DoneAppointmentListModule()
                                : Container(),
              ),
            ),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}


