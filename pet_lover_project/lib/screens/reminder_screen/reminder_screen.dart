import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/controllers/reminder_screen_controller/reminder_screen_controller.dart';
import 'package:pet_lover_project/screens/reminder_screen/reminder_screen_widgets.dart';

class ReminderScreen extends StatelessWidget {
  ReminderScreen({Key? key}) : super(key: key);

  final reminderScreenController = Get.put(ReminderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppBarModule(title: 'Reminder', appBarOption: AppBarOption.backButtonScreenOption),

              SizedBox(height: 20,),

              Text("Choose Pet Keeping Reminders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              SizedBox(height: 20,),

              Expanded(child: ReminderGridList())
            ],
          ),
        ),
      ),
    );
  }
}
