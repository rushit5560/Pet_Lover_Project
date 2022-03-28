import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home_screen/home_screen.dart';
import 'screens/sign_up_screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pet Service Project",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
