import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/enums.dart';

class CommonAppBarModule extends StatelessWidget {
  final String title;
  final AppBarOption appBarOption;
  Function? onTap;

  CommonAppBarModule(
      {Key? key, required this.title, required this.appBarOption, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leftSideButton(context),
        appBarOption == AppBarOption.homeScreenOption
            ? Image.asset(AppImages.petLoverNameImg, scale: 3)
            : Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
        _rightSideButton(),
      ],
    );
  }

  Widget _leftSideButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _leftSideButtonClick(appBarOption: appBarOption, context: context),
      child: Container(
        height: 52,
        width: 52,
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
        child: Image.asset(
          appBarOption == AppBarOption.homeScreenOption
              ? AppImages.menuIconImg
              :  AppImages.backButtonImg,
          scale: 2,
        ),
      ),
    );
  }

  Widget _rightSideButton() {
    return GestureDetector(
      onTap: () => _rightSideButtonClick(appBarOption: appBarOption),
      child: Container(
        height: 52,
        width: 52,
        decoration: appBarOption == AppBarOption.backButtonScreenOption
            ? null
            : BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: appBarOption == AppBarOption.homeScreenOption
          ? Image.asset(AppImages.msgIconImg, scale: 2)
        : null,
      ),
    );
  }


  _rightSideButtonClick({required AppBarOption appBarOption}) {}


  _leftSideButtonClick({required AppBarOption appBarOption, required BuildContext context}) {

    if (appBarOption == AppBarOption.homeScreenOption) {
      Scaffold.of(context).openDrawer();
    } else {
      Get.back();
    }

  }


}
