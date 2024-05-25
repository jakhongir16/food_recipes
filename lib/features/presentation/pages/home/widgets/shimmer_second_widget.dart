import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSecondWidget extends StatelessWidget {
  const ShimmerSecondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.greyColorShade400,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
