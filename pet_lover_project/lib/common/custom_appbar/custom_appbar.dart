import 'package:flutter/material.dart';

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
        /*appBarOption == AppBarOption.homeScreenOption
            ? Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Image.asset(AppImages.msgIconImg, scale: 2),
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
                : appBarOption == AppBarOption.userProfileScreenOption
                    ? Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Image.asset(AppImages.threeDotImg, scale: 2),
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
                              child: Image.asset(AppImages.profilePicImg, scale: 2),
                            ),
                          )
                        : Container(
                            height: 52,
                            width: 52,
                            color: Colors.transparent,
                          ),*/
      ],
    );
  }

  Widget _leftSideButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (appBarOption == AppBarOption.homeScreenOption) {
          Scaffold.of(context).openDrawer();
        }
      },
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
              : appBarOption == AppBarOption.petViewScreenOption
          ? AppImages.profilePicImg
          : AppImages.backButtonImg,
          scale: 2,
        ),
      ),
    );
  }

  Widget _rightSideButton() {
    return Container(
      height: 52,
      width: 52,
      decoration: appBarOption == AppBarOption.backButtonScreenOption
          ? null
          : BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      : appBarOption == AppBarOption.petShopScreenOption
      ? Image.asset(AppImages.cartImg, scale: 2)
      : appBarOption == AppBarOption.userProfileScreenOption
      ? Image.asset(AppImages.threeDotImg, scale: 2)
      : appBarOption == AppBarOption.petViewScreenOption
      ? Image.asset(AppImages.msgIconImg, scale: 2)
      : appBarOption == AppBarOption.createPostOption
      ? Center(
        child: Text(
          'POST',
          style: TextStyle(
            color: AppColors.colorDarkBlue1,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ) : appBarOption == AppBarOption.adoptPetScreenOption
      ? Image.asset(AppImages.msgIconImg, scale: 2)
      : null,
    );
  }
}
