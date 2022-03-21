import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/checkout_screen_controller/checkout_screen_controller.dart';
import 'package:pet_lover_project/screens/checkout_screen/checkout_screen_widgets.dart';

import '../../common/custom_appbar/custom_appbar.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  final checkoutScreenController = Get.put(CheckoutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBarModule(title: 'Checkout', appBarOption: AppBarOption.backButtonScreenOption),
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
        ).commonPadding(),
      ),
    );
  }
}
