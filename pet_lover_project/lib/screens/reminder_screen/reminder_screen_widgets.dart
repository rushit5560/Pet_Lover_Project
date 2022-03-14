import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/reminder_screen_controller/reminder_screen_controller.dart';

class ReminderGridList extends StatelessWidget {
  ReminderGridList({Key? key}) : super(key: key);

  ReminderScreenController reminderScreenController = Get.find<ReminderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: reminderScreenController.reminderList.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
           crossAxisSpacing: 10,
           mainAxisSpacing: 10,
           childAspectRatio: 1.1,
        ),
        itemBuilder: (context, i) {
          return reminderGridList(i);
        },
      ),
    );
  }

  Widget reminderGridList(i){
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(reminderScreenController.reminderList[i].image, scale: 1.7,),
            SizedBox(height: 10,),
            Text(reminderScreenController.reminderList[i].name)
          ],
        ),
      ),
    );
  }
}
