import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';

// ignore: must_be_immutable
class ContainerFilter extends StatelessWidget {
  ContainerFilter({
    super.key,
    required this.width,
    required this.assetName,
    required this.iconData,
    required this.title,
    required this.navigate,
  });

  double width;
  String assetName;
  IconData iconData;
  String title;
  void Function() navigate;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade300,
      child: InkWell(
        splashColor: AppColors.backgroundColors,
        highlightColor: AppColors.backgroundColors,
        borderRadius: BorderRadius.circular(10),
        onTap: navigate,
        child: Container(
          height: 70,
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.cover,
              opacity: 0.3,
            )
          ),
          child: Text(
            title,
            style: AppTextStyle.containerTextStyle,
          ),
        ),
      ),
    );
  }
}
