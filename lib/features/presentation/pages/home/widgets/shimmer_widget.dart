import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: width,
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.shimmerColors,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
