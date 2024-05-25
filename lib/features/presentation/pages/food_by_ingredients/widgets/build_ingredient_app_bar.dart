import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';

import '../../../../../constants/app_themes/app_colors.dart';

AppBar buildIngredientAppBar() {
  return AppBar(
   iconTheme: const IconThemeData(
   color: AppColors.darkBlackColors,
   ),
   backgroundColor: AppColors.white30,
   title: const Text(
     "FOOD BY INGREDIENTS",
     style: AppTextStyle.foodOriginAppBarStyle,
   ),
   elevation: 0,
   centerTitle: true,
  );
}