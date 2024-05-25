import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';

import '../../../../constants/app_themes/app_colors.dart';

AppBar searchAppBar(String title){
  return AppBar(
    title: Text(
      title,
      style: AppTextStyle.searchAppBarTextStyle,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.backgroundColors,
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(2),
      child: SizedBox(
        height: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.darkBlackColors,
          ),
        ),
      ),
    ),
  );
}