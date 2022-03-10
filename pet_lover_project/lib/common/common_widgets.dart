import 'package:flutter/material.dart';

import 'constants/app_images.dart';

class AuthScreenBackGroundModule extends StatelessWidget {
  final String heading;
  const AuthScreenBackGroundModule({Key? key, required this.heading}) : super(key: key);

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
              )
          ),
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
