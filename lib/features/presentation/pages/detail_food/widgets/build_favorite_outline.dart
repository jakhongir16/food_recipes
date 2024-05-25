import 'package:flutter/material.dart';

import '../../../../../constants/app_themes/app_colors.dart';

Container buildFavoriteOutline() {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.black12,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: AppColors.whiteColor),
    ),
    child: const Icon(
      Icons.favorite_outline,
      color: AppColors.whiteColor,
    ),
  );
}