import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/blog_screen/blog_screen.dart';
import 'screens/sign_up_screen/sign_up_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pet Lover Project",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: "Quicksand"
      ),

      home: SignUpScreen(),

    );
  }
}
