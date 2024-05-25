import 'package:flutter/material.dart';
import 'widgets/body_build_food_country.dart';
import 'widgets/build_app_bar_pattern.dart';

class FoodCountryPage extends StatelessWidget {
  const FoodCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const BodyBuildFoodCountry(),
    );
  }
}
