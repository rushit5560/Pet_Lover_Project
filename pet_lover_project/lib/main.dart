import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/screens/index_screen/index_screen.dart';


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

      home: IndexScreen(),

    );
  }
}
