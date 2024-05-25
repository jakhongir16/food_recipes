import 'package:flutter/material.dart';

import '../../../../constants/app_themes/app_colors.dart';
import '../../../../constants/app_themes/app_style.dart';

AppBar buildAppBarPattern(String title) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: AppColors.darkBlackColors,
    ),
    backgroundColor: AppColors.white54,
    elevation: 0,
    title: Text(
      title,
      style: AppTextStyle.foodOriginAppBarStyle,
    ),
    centerTitle: true,
  );
}