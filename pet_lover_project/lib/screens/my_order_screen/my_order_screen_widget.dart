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
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex:1,
                              child: Image.asset(AppImages.accessories6Img, scale: 2,)),
                          const SizedBox(width: 20,),

                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Lorem Ipsum", maxLines: 1,
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                                SizedBox(height: 5,),
                                Text("\$15.00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                   Expanded(
                     flex: 1,
                     child: Row(
                       children: [
                          Container(
                            height: 35, width: Get.width /5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.colorDarkBlue
                            ),
                            child: const Center(
                              child: Text("Shipped", style: TextStyle(
                                color: Colors.white, fontSize: 13
                              ),),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Image.asset(AppImages.arrow, scale: 2,)

                       ],
                     ),
                   )
                  ],
                ),
              ),
          );
        });
  }
}
