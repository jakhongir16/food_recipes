import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../bloc/meal_country/meal_country_bloc.dart';

class BodyBuildFoodCountry extends StatelessWidget {
  const BodyBuildFoodCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCountryBloc, MealCountryState>(
      builder: (context, state) {
        if(state.status.isLoading){
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColors.white30,
              size: 50,
            ),
          );
        }
        if(state.status.isSuccess){
          return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.mealCountry.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    "/detailFoodCountry",
                    arguments: state.mealCountry[index].strArea,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/flags/${state.mealCountry[index].strArea}.png"),
                            Text(state.mealCountry[index].strArea),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
        return const Text('There is an error');
      },

    );
  }
}
