import 'package:get/get.dart';

class SetReminderScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt selectedHr = 12.obs;
  RxInt selectedMinute = 30.obs;
  RxBool isAmSelected = true.obs;
  RxString amPmText = 'AM'.obs;

  List<int> hoursList = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12];
  List<int> minutesList = [00, 05, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
}