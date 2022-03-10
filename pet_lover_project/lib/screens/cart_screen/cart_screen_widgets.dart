import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/controllers/cart_screen_controller/cart_screen_controller.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  CartScreenController cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Slidable(
            // Specify a key if the Slidable is dismissible.
            key: const ValueKey(0),
            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 1,
                  onPressed: doNothing,
                  backgroundColor: AppColors.colorLightBlue,
                  foregroundColor: AppColors.colorDarkBlue1,
                  icon: Icons.clear,
                  //label: 'Archive',
                ),

              ],
            ),
            child: Container(
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
                        Image.asset(AppImages.belt, scale: 2,),
                        const SizedBox(width: 20,),
                ],
              ),
              child: Container(
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
                          SizedBox(width: 20,),

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
                        const Text("QTY:",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        const SizedBox(width: 10,),


                        GestureDetector(
                            onTap: (){
                              cartScreenController.count += 1;
                            },
                            child: Container(
                              height: 20,width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.colorDarkBlue
                              ),
                              child: Center(
                                child: Image.asset(AppImages.plus, scale: 2,),
                              ),
                          Container(
                            height: 20,width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.colorDarkBlue
                            ),
                            child: Center(
                              child: Image.asset(AppImages.plusImg),
                            ),
                          ),

                        const SizedBox(width: 5,),

                          Container(
                            height: 20,width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.colorDarkBlue
                            ),
                            child: Center(
                              child: Image.asset(AppImages.minusImg),
                        Obx(()=> Text("${cartScreenController.count}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),)),
                        const SizedBox(width: 5,),

                           GestureDetector(
                            onTap: (){
                              if (cartScreenController.count > 1) {
                                cartScreenController.count -= 1;
                              }
                            },
                            child: Container(
                              height: 20,width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.colorDarkBlue
                              ),
                              child: Center(
                                child: Image.asset(AppImages.minus, scale: 2,),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void doNothing(BuildContext context) {}
}

class CartDetails extends StatelessWidget {
  const CartDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //border: Border.all(color: AppColors.colorDarkBlue1),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 5,
          spreadRadius: 5,
          blurStyle: BlurStyle.outer
        )
        ]
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("3 Items", style: TextStyle(fontSize: 18, color: AppColors.colorDarkBlue),),
              Text("\$70.00", style: TextStyle(fontSize: 18, color: AppColors.colorDarkBlue))
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tax", style: TextStyle(fontSize: 18, color: AppColors.colorDarkBlue)),
              Text("\$10.00", style: TextStyle(fontSize: 18, color: AppColors.colorDarkBlue))
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
              Text("\$80.00", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
            child: Container()),
        Expanded(
          flex: 3,
          child: Container(
            height: 50,
            //width: Get.width/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.colorDarkBlue
            ),
            child: const Center(
              child: Text("Process to Checkout", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ],
    );
  }
}


