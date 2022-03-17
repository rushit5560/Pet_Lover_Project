import 'package:flutter/material.dart';

import 'app_colors.dart';

Decoration containerElevationDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
          color: AppColors.colorDarkBlue1.withOpacity(0.2),
          blurRadius: 1,
          spreadRadius: 2,
          blurStyle: BlurStyle.outer
      ),
    ],
  );
}