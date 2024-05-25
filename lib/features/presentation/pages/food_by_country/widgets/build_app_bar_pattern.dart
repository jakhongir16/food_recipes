import 'package:flutter/material.dart';

import '../../../../../constants/app_themes/app_colors.dart';
import '../../../../../constants/app_themes/app_style.dart';

AppBar buildAppBar() {
  return AppBar(
    iconTheme: const IconThemeData(color: AppColors.darkBlackColors),
    backgroundColor: AppColors.white30,
    title: const Text(
      "FOOD BY COUNTRY",
      style: AppTextStyle.foodOriginAppBarStyle,
    ),
    elevation: 0,
    centerTitle: true,
  );
}