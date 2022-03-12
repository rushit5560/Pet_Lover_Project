import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:pet_lover_project/screens/cart_screen/cart_screen_widgets.dart';

import '../../common/custom_appbar/custom_appbar.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

   final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            children: [
              CommonAppBarModule(title: 'Cart', appBarOption: AppBarOption.backButtonScreenOption),

              const SizedBox(height: 20,),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CartList(),
                      const SizedBox(height: 20,),

                      CartDetails(),
                      const SizedBox(height: 20,),

                      CheckOutButton()
                    ],
                  ),
                ),
              )





            ],
          ),
        )
      ),
    );
  }
}
