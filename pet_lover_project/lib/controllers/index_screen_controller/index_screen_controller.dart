import 'package:get/get.dart';

import '../../screens/home_screen/home_screen.dart';

class IndexScreenController extends GetxController {
  RxInt currentSelectedIndex = 0.obs;
  final tabs = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];
}