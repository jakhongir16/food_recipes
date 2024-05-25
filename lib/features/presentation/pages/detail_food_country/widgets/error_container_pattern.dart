import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';

Widget errorContainerPattern(BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: 100,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
       color: Colors.grey.shade200,
       child: const Text('Unable to receive data',
       style: AppTextStyle.containerTextStyle,
       ),
      ),
    ),
  );
}