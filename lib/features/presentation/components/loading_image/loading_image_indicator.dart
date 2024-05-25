import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingImageIndicator extends StatelessWidget {
  const LoadingImageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.flickr(
        leftDotColor: AppColors.shimmerColors,
        rightDotColor: AppColors.darkBlackColors,
        size: 20,
      ),
    );
  }
}
