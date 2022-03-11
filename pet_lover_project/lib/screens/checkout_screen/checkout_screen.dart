import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/controllers/checkout_screen_controller/checkout_screen_controller.dart';
import 'package:pet_lover_project/screens/checkout_screen/checkout_screen_widgets.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  final checkoutScreenController = Get.put(CheckoutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonAppBarModule(title: 'Checkout'),
              const SizedBox(height: 25,),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      paymentText(),
                      const SizedBox(height: 25,),
                      PaymentDetails(),
                      const SizedBox(height: 25,),
                      DeliveryAddressModule(),
                      const SizedBox(height: 25,),
                      OrderSummaryModule(),
                      const SizedBox(height: 25,),

                      PlaceOrderButton()
                    ],
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
