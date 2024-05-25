import 'package:flutter/material.dart';

import '../../../../data/models/detail_food/detail_food.dart';

class TextSentencesPattern extends StatelessWidget {
  const TextSentencesPattern({super.key, required this.detailMeal});
  final DetailFood detailMeal;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (detailMeal.strIngredient1 == "")
            ? const SizedBox()
            : Text(
          "${detailMeal.strIngredient1} : ${detailMeal.strMeasure1}",
        ),
        (detailMeal.strIngredient2 == "")
            ? const SizedBox()
            : Text(
          "${detailMeal.strIngredient2} : ${detailMeal.strMeasure2}",
        ),
        (detailMeal.strIngredient3 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient3} : ${detailMeal.strMeasure3}"),
        (detailMeal.strIngredient4 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient4} : ${detailMeal.strMeasure4}"),
        (detailMeal.strIngredient5 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient5} : ${detailMeal.strMeasure5}"),
        (detailMeal.strIngredient6 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient6} : ${detailMeal.strMeasure6}"),
        (detailMeal.strIngredient7 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient7} : ${detailMeal.strMeasure7}"),
        (detailMeal.strIngredient8 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient8} : ${detailMeal.strMeasure8}"),
        (detailMeal.strIngredient9 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient9} : ${detailMeal.strMeasure9}"),
        (detailMeal.strIngredient10 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient10} : ${detailMeal.strMeasure10}"),
        (detailMeal.strIngredient11 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient11} : ${detailMeal.strMeasure11}"),
        (detailMeal.strIngredient12 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient12} : ${detailMeal.strMeasure12}"),
        (detailMeal.strIngredient13 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient13} : ${detailMeal.strMeasure13}"),
        (detailMeal.strIngredient14 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient14} : ${detailMeal.strMeasure14}"),
        (detailMeal.strIngredient15 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient15} : ${detailMeal.strMeasure15}"),
        (detailMeal.strIngredient16 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient16} : ${detailMeal.strMeasure16}"),
        (detailMeal.strIngredient17 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient17} : ${detailMeal.strMeasure17}"),
        (detailMeal.strIngredient18 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient18} : ${detailMeal.strMeasure18}"),
        (detailMeal.strIngredient19 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient19} : ${detailMeal.strMeasure19}"),
        (detailMeal.strIngredient20 == "")
            ? const SizedBox()
            : Text(
            "${detailMeal.strIngredient20} : ${detailMeal.strMeasure20}"),
      ],
    );
  }
}
