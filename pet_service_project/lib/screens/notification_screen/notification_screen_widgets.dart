import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(bottom: 15, left: 5, right: 5, top: 5),
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
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: Container(
                            height: 50, width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
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
                            child: Image.asset(AppImages.notificationMenuImg, scale: 2,),
                          ),
                        ),
                        const SizedBox(width: 15,),

                        const Expanded(
                          flex: 4,
                          child: Text("Danver Ballard Sent you  Message", maxLines: 1,style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Expanded(
                    flex: 1,
                    child: Text("10:55", style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500
                    ),),
                  )
                ],
              ),
            ),
          );
        });
  }
}
