import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/screens/track_order_screen/track_order_screen_widgets.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            CommonAppBarModule(title: 'Track Order', appBarOption: AppBarOption.backButtonScreenOption),
            const SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                     OrderList(),
                     SizedBox(height: 10,),
                     OrderReviewModule(),
                     SizedBox(height: 15,),
                      OrderSummaryTextModule(),
                    SizedBox(height: 15,),
                      OrderSummaryModule(),
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
