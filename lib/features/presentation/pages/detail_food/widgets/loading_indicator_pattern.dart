import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../constants/app_themes/app_colors.dart';

class LoadingIndicatorPattern extends StatelessWidget {
  const LoadingIndicatorPattern({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height: height,
      child: Center(
        child: LoadingAnimationWidget.inkDrop(
            color: AppColors.black38,
            size: 50
        ),
      ),
    );
  }
}
