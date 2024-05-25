import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';
import 'package:food_recipes/features/presentation/bloc/favorite_meal/favourite_meal_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../constants/app_themes/app_colors.dart';
import 'widget/build_app_favorite_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<FavouriteMealBloc>().add(
          EventGetAllFavouriteMeal(),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppFavoriteBar(),
      body: BlocBuilder<FavouriteMealBloc, FavouriteMealState>(
        builder: (context, state){
          if(state is FavouriteFoodLoading) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: AppColors.black38,
                  size: 50),
            );
          }
          if(state is SuccessGetAllFavouriteFood){
            return ListView.builder(
                itemCount: state.allFavouriteFood.length,
                itemBuilder: (context, index){
                  var food = state.allFavouriteFood[index];
                  return ListTile(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detailFood',
                      arguments: food['id_meal'],
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
                        imageUrl: "${food['meal_thumb']}",
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, url, progress){
                          return Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: AppColors.shimmerColors,
                                size: 25
                            ),
                          );
                        },
                      ),
                    ),
                    title: Text("${food['meal_name']}"),
                    titleAlignment: ListTileTitleAlignment.center,
                  );
                });
          }
          return Center(
            child: Text(
              "Favourite Food is Empty",
              style: AppTextStyle.foodDetailSecondTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    );
  }


}
