import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';

abstract class AppTextStyle {
  AppTextStyle._();

  static const TextStyle fontSplash = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,

  );

  static const TextStyle introTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlackColors,
    fontSize: 36,
  );

  static const TextStyle introSecondTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlackColors,
    fontSize: 26,
  );

  static const TextStyle introThirdTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlackColors,
    fontSize: 18,
  );

  static const TextStyle introFourthTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle containerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle appBarStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  );

  static const TextStyle foodOriginAppBarStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle foodDetailTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30
  );

  static const TextStyle foodDetailSecondTextStyle = TextStyle(
      fontSize: 16,
      color: AppColors.greyColorShade400
  );


  static const TextStyle searchAppBarTextStyle = TextStyle(
      fontSize: 20,
      color: AppColors.darkBlackColors,
      fontWeight: FontWeight.bold,
  );

}