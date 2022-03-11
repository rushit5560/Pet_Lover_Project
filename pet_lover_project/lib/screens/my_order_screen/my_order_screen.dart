import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/screens/my_order_screen/my_order_screen_widget.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            children: [
              CommonAppBarModule(title: 'My Order', index: 1),

              const SizedBox(height: 20,),
              Expanded(child: OrderList()),
            ],
          ),
        ),
      ),
    );
  }
}
