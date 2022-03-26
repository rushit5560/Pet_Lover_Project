import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/wallet_screen_controller/wallet_screen_controller.dart';

WalletScreenController screenController = Get.find<WalletScreenController>();

class TabViewModule extends StatelessWidget {
  const TabViewModule({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                screenController.isRedeemSelected.value = true;
                screenController.isTransactionSelected.value = false;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 12),
                child: Center(
                  child: Text(
                    'Redeem Points',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                      fontSize: 18,
                      fontWeight: screenController.isRedeemSelected.value ?  FontWeight.bold  :FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                screenController.isRedeemSelected.value = false;
                screenController.isTransactionSelected.value = true;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Center(
                  child: Text(
                    'Transaction',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: AppColors.colorDarkBlue,
                      fontSize: 18,
                      fontWeight: screenController.isTransactionSelected.value ?  FontWeight.bold  :FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class RedeemPointsModule extends StatelessWidget {
  const RedeemPointsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(bottom: 15, left: 3, right: 3, top: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorDarkBlue1.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                      Image.asset(AppImages.redeemImg, scale: 2,),
                      const SizedBox(width: 15,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Reward1", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                            SizedBox(height: 5,),
                            Text("Lorem Ipsum is simply dummy dggdg", maxLines:1,style: TextStyle(fontSize: 12, color: Colors.black),)
                          ],
                        ),
                      ),

                  const SizedBox(width: 10,),
                  Container(
                    height: 40, width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.colorDarkBlue1
                    ),
                    child: const Center(
                      child: Text("Redeem", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class WalletTransactionModule extends StatelessWidget {
  const WalletTransactionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(bottom: 15, left: 3, right: 3, top: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorDarkBlue1.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Lorem Ipsum", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                        SizedBox(height: 5,),
                        Text("Lorem Ipsum is simply dummy dggdgdfdff", maxLines:1,style: TextStyle(fontSize: 12, color: Colors.black),)
                      ],
                    ),
                  ),

                Text("+ 20 points", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),

                ],
              ),
            ),
          );
        });
  }
}

