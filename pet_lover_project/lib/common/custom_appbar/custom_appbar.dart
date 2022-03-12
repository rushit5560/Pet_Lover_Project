import 'package:flutter/material.dart';

import '../constants/app_images.dart';
import '../constants/enums.dart';

class CommonAppBarModule extends StatelessWidget {
  final String title;
  final AppBarOption appBarOption;

  CommonAppBarModule(
      {Key? key, required this.title, required this.appBarOption})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              if (appBarOption == AppBarOption.homeScreenOption) {
                // scaffoldKey.currentState!.openDrawer();
                Scaffold.of(context).openDrawer();
              }
            },
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Image.asset(
                appBarOption == AppBarOption.homeScreenOption
                    ? AppImages.menuIconImg
                    : AppImages.backButtonImg,
                scale: 2,
              ),
            ),
          ),
        ),
        appBarOption == AppBarOption.homeScreenOption
            ? Image.asset(AppImages.petLoverNameImg, scale: 3)
            : Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        appBarOption == AppBarOption.homeScreenOption
            ? Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Image.asset(
              AppImages.msgIconImg,
              scale: 2,
            ),
          ),
        )
            : appBarOption == AppBarOption.petShopScreenOption
            ? Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Image.asset(
              AppImages.cartImg,
              scale: 2,
            ),
          ),
        )
            : Container(
          height: 45,
          width: 45,
          color: Colors.transparent,
        ),
      ],
    );
  }
}