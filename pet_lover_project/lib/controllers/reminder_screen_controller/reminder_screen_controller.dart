import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/models/reminder_screen_model/reminder_screen_model.dart';

class ReminderScreenController extends GetxController{

  List<ReminderScreenModel> reminderList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    petRemindersList();
  }

  petRemindersList(){
    reminderList.add(
      ReminderScreenModel(
          image: AppImages.vaccinationImg,
          name: 'Vaccinations',
      ),
    );

    reminderList.add(
      ReminderScreenModel(
        image: AppImages.bathingImg,
        name: 'Bathing',
      ),
    );

    reminderList.add(
      ReminderScreenModel(
        image: AppImages.deWarmingImg,
        name: 'DeWorming',
      ),
    );

    reminderList.add(
      ReminderScreenModel(
        image: AppImages.walkingImg,
        name: 'Walking',
      ),
    );

    reminderList.add(
      ReminderScreenModel(
        image: AppImages.feedingImg,
        name: 'Feeding',
      ),
    );

    reminderList.add(
      ReminderScreenModel(
        image: AppImages.medicinesImg,
        name: 'Medicines',
      ),
    );
  }
}