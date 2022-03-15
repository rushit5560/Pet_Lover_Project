import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';

import '../../controllers/set_reminder_screen_controller/set_reminder_screen_controller.dart';
import 'set_reminder_screen_widgets.dart';

class SetReminderScreen extends StatefulWidget {
  const SetReminderScreen({Key? key}) : super(key: key);

  @override
  State<SetReminderScreen> createState() => _SetReminderScreenState();
}

class _SetReminderScreenState extends State<SetReminderScreen> {
  final setReminderScreenController = Get.put(SetReminderScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              CommonAppBarModule(title: 'Vaccinations', appBarOption: AppBarOption.backButtonScreenOption),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    TableCalender(),
                    SetTimeModule(),
                    const SizedBox(height: 30),
                    RepeatModule(),
                    const SizedBox(height: 20),
                    SaveButtonModule(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
