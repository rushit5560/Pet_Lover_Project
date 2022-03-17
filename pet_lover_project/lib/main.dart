import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/screens/Forgot_password_screen/forgot_password_screen.dart';
import 'package:pet_lover_project/screens/add_details_screen/add_details_screen.dart';
import 'package:pet_lover_project/screens/add_pet_lost_details_screen/add_pet_lost_details_screen.dart';
import 'package:pet_lover_project/screens/adopt_pet_screen/adopt_pet_screen.dart';
import 'package:pet_lover_project/screens/cart_screen/cart_screen.dart';
import 'package:pet_lover_project/screens/chat_screen/chat_screen.dart';
import 'package:pet_lover_project/screens/checkout_screen/checkout_screen.dart';
import 'package:pet_lover_project/screens/index_screen/index_screen.dart';
import 'package:pet_lover_project/screens/my_order_screen/my_order_screen.dart';
import 'package:pet_lover_project/screens/near_by_pet_services_screen/near_by_pet_services_screen.dart';
import 'package:pet_lover_project/screens/pet_match_screen/pet_match_screen.dart';
import 'package:pet_lover_project/screens/profile_screens/pet_profile_screen/pet_profile_screen.dart';
import 'package:pet_lover_project/screens/reminder_screen/reminder_screen.dart';
import 'package:pet_lover_project/screens/sign_in_screen/sign_in_screen.dart';
import 'package:pet_lover_project/screens/sign_up_screen/sign_up_screen.dart';
import 'package:pet_lover_project/screens/track_order_screen/track_order_screen.dart';

import 'screens/conversation_screen/conversation_screen.dart';


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

      home: PetProfileScreen(),

    );
  }
}
