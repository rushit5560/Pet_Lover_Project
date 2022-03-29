import 'package:flutter/material.dart';
import 'package:pet_service_project/common/constants/app_images.dart';

import 'constants/app_colors.dart';

class AuthScreenBackGroundModule extends StatelessWidget {

  const AuthScreenBackGroundModule({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 35,
          child: _imageAndTextModule(),
        ),
        Expanded(
          flex: 65,
          child: Container(color: Colors.white),
        ),
      ],
    );
  }

  Widget _imageAndTextModule() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(AppImages.authBgImg),
            fit: BoxFit.cover,
          )),
    );
  }
}

class TextFieldElevationModule extends StatelessWidget {
  final double? height;
  const TextFieldElevationModule({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorDarkBlue1.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 3,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
    );
  }
}
