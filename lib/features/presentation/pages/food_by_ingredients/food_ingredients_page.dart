import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/rest_api/constants.dart';
import 'package:food_recipes/features/presentation/components/loading_image/loading_image_indicator.dart';
import 'package:food_recipes/features/presentation/components/loading_indicator/loading_indicator.dart';

import '../../bloc/meal_ingredient/meal_ingredient_bloc.dart';
import 'widgets/build_ingredient_app_bar.dart';

class FoodIngredientsPage extends StatelessWidget {
  const FoodIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildIngredientAppBar(),
      body: BlocBuilder<MealIngredientBloc, MealIngredientState>(
        builder: (context, state){
          if(state.status.isLoading){
           return const LoadingIndicator();
             }
           if(state.status.isSuccess) {
             return GridView.builder(
                 padding: const EdgeInsets.all(10),
                 itemCount: state.allIngredients.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                 ),
                 itemBuilder: (context, index){
                   return InkWell(
                     onTap: () => Navigator.pushNamed(
                       context,
                       '/detailFoodIngredient',
                       arguments: state.allIngredients[index].strIngredient,
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
                             SizedBox(
                               width: 50,
                               height: 50,
                               child: CachedNetworkImage(
                                 imageUrl: "${AppContants.baseUrlImage}${state.allIngredients[index].strIngredient}.png",
                                 progressIndicatorBuilder: (context, url, progress) => const LoadingImageIndicator(),
                               ),
                             ),
                             Text(
                               state.allIngredients[index].strIngredient,
                               textAlign: TextAlign.center,
                             ),
                           ],
                         ),
                       ),
                       ),
                     ),
                   );
                 });
           }
           return const Text('There is an error');
          }
      ),
    );
  }


}
