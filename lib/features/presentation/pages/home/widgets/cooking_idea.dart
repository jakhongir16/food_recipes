import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';

// ignore: must_be_immutable
class CookingIdea extends StatelessWidget {
  CookingIdea({
    super.key,
    required this.width,
    required this.idMeal,
    required this.networkImageName,
    required this.titleOfFood,
    required this.titleOfCategory,
    required this.titleOfArea,
    required this.titleOfSuitiblity,
  });


  final double width;
  String idMeal;
  String networkImageName;
  String titleOfFood;
  String titleOfCategory;
  String titleOfArea;
  String titleOfSuitiblity;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      shadowColor: Colors.blueGrey.shade300,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, "/detailFood", arguments: idMeal),
      splashColor: AppColors.backgroundColors,
      hoverColor: AppColors.backgroundColors,
      highlightColor: AppColors.backgroundColors,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 150),
        width: width - 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(networkImageName),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ),
            const SizedBox(width: 10,),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      titleOfFood,
                      maxLines: 3,
                      style: AppTextStyle.containerTextStyle.copyWith(
                        fontSize: 17
                      ),
                    ),
                    AutoSizeText(
                      "$titleOfArea, $titleOfCategory",
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10,),
                     Text(
                      "Suitable",
                      style: AppTextStyle.containerTextStyle.copyWith(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    AutoSizeText(
                      titleOfSuitiblity,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
