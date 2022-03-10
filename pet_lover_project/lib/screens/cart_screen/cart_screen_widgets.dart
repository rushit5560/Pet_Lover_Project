import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
          shrinkWrap: true,
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
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: AppColors.colorLightBlue,
                    foregroundColor: AppColors.colorDarkBlue1,
                    icon: Icons.clear,
                    //label: 'Archive',
                  ),

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
                              Text("Lorem Ipsum"),
                              Text("\$15.00")
                            ],
                          )
                        ],
                      ),

                      Row(
                        children: [
                          Text("QTY:"),

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

                          Text("2"),

                          Container(
                            height: 20,width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.colorDarkBlue
                            ),
                            child: Center(
                              child: Image.asset(AppImages.minusImg),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void doNothing(BuildContext context) {}
}
