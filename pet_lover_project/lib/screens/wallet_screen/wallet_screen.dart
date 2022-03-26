import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/controllers/wallet_screen_controller/wallet_screen_controller.dart';
import 'package:pet_lover_project/screens/wallet_screen/wallet_screen_widgets.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);

  final walletScreenController = Get.put(WalletScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'Wallet', appBarOption: AppBarOption.backButtonScreenOption),
            const SizedBox(height: 20,),

            const TabViewModule(),

            const SizedBox(height: 20,),

            Expanded(
                child: Obx(()=>
                walletScreenController.isRedeemSelected.value ?
                const RedeemPointsModule() :  const WalletTransactionModule(),
                ),)
          ],
        ).commonPadding(),
      ),
    );
  }
}
