import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImages.beltImg, scale: 2,),
                        const SizedBox(width: 20,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Lorem Ipsum", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                            SizedBox(height: 5,),
                            Text("\$15.00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),)
                          ],
                        )
                      ],
                    ),

                   Row(
                     children: [
                        Container(
                          height: 40, width: Get.width /4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.colorDarkBlue
                          ),
                          child: const Center(
                            child: Text("Shipped", style: TextStyle(
                              color: Colors.white
                            ),),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Image.asset(AppImages.arrow, scale: 1.5,)

                     ],
                   )
                  ],
                ),
              ),
          );
        });
  }
}
