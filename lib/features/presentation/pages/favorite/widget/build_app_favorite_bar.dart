import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';

import '../../../../../constants/app_themes/app_colors.dart';

AppBar buildAppFavoriteBar() {
  return AppBar(
   title:  Text(
     "FAVOURITE FOOD",
     style: AppTextStyle.foodOriginAppBarStyle.copyWith(
       fontSize: 20
     ),
   ),
   centerTitle: true,
   elevation: 0,
   backgroundColor: AppColors.backgroundColors,
   bottom: const PreferredSize(
     preferredSize: Size.fromHeight(2),
     child: DecoratedBox(
       decoration: BoxDecoration(
         color: AppColors.darkBlackColors,
       ),
       child: SizedBox(
         height: 2,
       ),
     ),
   ),
  );
}