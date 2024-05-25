import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/filter_ingredient/filter_ingredient_bloc.dart';
import 'package:food_recipes/features/presentation/components/build_app_bar_pattern/build_app_bar_pattern.dart';
import 'package:food_recipes/features/presentation/components/error_data_pattern/error_data_pattern.dart';
import 'package:food_recipes/features/presentation/components/loading_image/loading_image_indicator.dart';
import 'package:food_recipes/features/presentation/components/loading_indicator/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailFoodIngredientsPage extends StatefulWidget {
  final String nameOfIngredient;
  const DetailFoodIngredientsPage({super.key, required this.nameOfIngredient});

  @override
  State<DetailFoodIngredientsPage> createState() => _DetailFoodIngredientsPageState();
}

class _DetailFoodIngredientsPageState extends State<DetailFoodIngredientsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<FilterIngredientBloc>().add(
          EventDetailMealIngredient(widget.nameOfIngredient),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarPattern(widget.nameOfIngredient),
      body: BlocBuilder<FilterIngredientBloc, FilterIngredientState>(
        builder: (context, state){
          if(state.status.isLoading){
          return const LoadingIndicator();
          }
          if(state.status.isSuccess){
            return ListView.builder(
                itemCount: state.allMeals.length,
                itemBuilder: (context, index){
                  return ListTile(
                    onTap: () => Navigator.pushNamed(
                      context,
                      "/detailFood",
                      arguments: state.allMeals[index].id,
                    ),
                    style: ListTileStyle.drawer,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    leading: SizedBox(
                      height: 80,
                      width: 80,
                      child: CachedNetworkImage(
                        imageUrl: state.allMeals[index].mealThumb,
                        imageBuilder: (context, imageProvider) => SizedBox(
                          width: 80,
                          height: 80,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, url, progress) {
                          return const LoadingImageIndicator();
                        },
                      ),
                    ),
                    title: Text(state.allMeals[index].mealTitle),
                    titleAlignment: ListTileTitleAlignment.center,
                  );
                });
          }
          return const ErrorDataPattern();
        },
      ),
    );
  }
}
