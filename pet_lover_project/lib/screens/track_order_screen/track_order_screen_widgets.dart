import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
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
                ],
              ),
            ),
          );
        });
  }
}

class OrderReviewModule extends StatelessWidget {
  const OrderReviewModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text("Order Review", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),),
        SizedBox(height: 10,),
        Text("Order Number - #6857484", style: TextStyle(color: Colors.black, fontSize: 15),),
        SizedBox(height: 10,),

        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.colorDarkBlue1
                    ),
                    child: Image.asset(AppImages.orderConfrimImg, scale: 1.7,),

                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Order Confirmed",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Lorem ipsum is simply dummy text",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Text("11.00", style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        Container(
          height: 30,
          width: 80,
          alignment: Alignment.center,
          child: Container(width: 2, color: AppColors.colorDarkBlue1,  height: 30),
        ),

        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.colorDarkBlue1
                    ),
                    child: Image.asset(AppImages.orderPackedImg, scale: 1.7,),

                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Order Packed",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Lorem ipsum is simply dummy text",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Text("12.00", style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        Container(
          height: 30,
          width: 80,
          alignment: Alignment.center,
          child: Container(width: 2, color: AppColors.colorDarkBlue1,  height: 30),
        ),

        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.colorDarkBlue1
                    ),
                    child: Image.asset(AppImages.orderShippedImg, scale: 1.7,),

                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Order Shipped",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Lorem ipsum is simply dummy text",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Text("5.00", style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        Container(
          height: 30,
          width: 80,
          alignment: Alignment.center,
          child: Container(width: 2, color: AppColors.colorDarkBlue1,  height: 30),
        ),

        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Image.asset(AppImages.orderDeliveredImg, scale: 1.7,),

                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Order Delivered",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Lorem ipsum is simply dummy text",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Text("5.00", style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),


      ],
    );
  }
}

class OrderSummaryTextModule extends StatelessWidget {
  const OrderSummaryTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Order Summary',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class OrderSummaryModule extends StatelessWidget {
  const OrderSummaryModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //border: Border.all(color: AppColors.colorDarkBlue1),
            boxShadow: [
              BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer
              )
            ]
        ),

        child: Column(
          children: [
            _singleItemModule(title: "Sub Total", value: "70.00"),
            const SizedBox(height: 5),
            _singleItemModule(title: "Tax", value: "10.00"),
            const SizedBox(height: 5),
            _singleItemModule(title: "Delivery", value: "20.00"),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                Text("\$100.00", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _singleItemModule({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, color: AppColors.colorDarkBlue),),
        Text("\$$value", style: TextStyle(fontSize: 18, color: AppColors.colorDarkBlue))
      ],
    );
  }
}

