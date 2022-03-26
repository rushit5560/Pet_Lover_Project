import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/app_images.dart';


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
            blurRadius: 10,
            spreadRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
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
