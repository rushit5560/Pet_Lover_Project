import 'package:get/get.dart';

class UserProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isPhotoViewSelected = true.obs;
}