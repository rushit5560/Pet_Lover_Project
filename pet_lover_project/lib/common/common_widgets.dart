import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'constants/app_images.dart';
import 'constants/enums.dart';

class AuthScreenBackGroundModule extends StatelessWidget {
  final String heading;

  const AuthScreenBackGroundModule({Key? key, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 35,
          child: _imageAndTextModule(heading: heading),
        ),
        Expanded(
          flex: 65,
          child: Container(color: Colors.white),
        ),
      ],
    );
  }

  Widget _imageAndTextModule({required String heading}) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(AppImages.authBgImg),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          top: 25,
          left: 40,
          child: SafeArea(
            child: Text(
              heading,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldElevationModule extends StatelessWidget {
  const TextFieldElevationModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
    );
  }
}

class CommonAppBarModule extends StatelessWidget {
  final String title;
  AppBarOption appBarOption;

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

class LeftArrowButtonModule extends StatelessWidget {
  const LeftArrowButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkBlue1),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 15),
      ),
    );
  }
}

class RightArrowButtonModule extends StatelessWidget {
  const RightArrowButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkBlue1),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 15),
      ),
    );
  }
}
