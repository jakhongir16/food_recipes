import 'package:flutter/material.dart';

import '../../../../../constants/app_themes/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 5,
        top: 5,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.secondDarkColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
        ));
  }
}
