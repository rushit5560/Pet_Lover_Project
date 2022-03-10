import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/screens/cart_screen/cart_screen.dart';
import 'package:pet_lover_project/screens/my_order_screen/my_order_screen.dart';

import 'screens/sign_in_screen/sign_in_screen.dart';

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
      home: CartScreen(),
    );
  }
}
