import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';
import 'package:food_recipes/features/presentation/pages/detail_food/widgets/build_favorite.dart';
import 'package:food_recipes/features/presentation/pages/detail_food/widgets/loading_indicator_pattern.dart';
import 'package:food_recipes/features/presentation/pages/detail_food/widgets/material_container.dart';
import 'package:food_recipes/features/presentation/pages/detail_food/widgets/text_sentences_pattern.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/app_themes/app_colors.dart';
import '../../../data/models/detail_food/detail_food.dart';
import '../../bloc/detail_meal/detail_meal_bloc.dart';
import '../../bloc/favorite_meal/favourite_meal_bloc.dart';
import 'widgets/arrow_back_button.dart';
import 'widgets/build_favorite_outline.dart';

class DetailFoodPage extends StatefulWidget {
  final String idMeal;

  const DetailFoodPage({super.key, required this.idMeal});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailMealBloc>().add(EventDetailMeal(widget.idMeal));
    context
        .read<FavouriteMealBloc>()
        .add(EventFoundFavouriteMeal(widget.idMeal));
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BlocListener<FavouriteMealBloc, FavouriteMealState>(
                listener: (context, state) {
                  if (state is SuccessAddFavouriteFood) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Add to favourite food",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        backgroundColor: AppColors.darkBlackColors,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  if (state is SuccessDeleteFavouriteFood) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Remove from favourite food",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        backgroundColor: AppColors.darkBlackColors,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: BlocBuilder<DetailMealBloc, DetailMealState>(
                  builder: (context, state) {
                    if (state.status.isLoading) {
                      return LoadingIndicatorPattern(
                          width: width, height: height);
                    }
                    if (state.status.isSuccess) {
                      DetailFood detailMeal = state.mealDetail!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: width,
                                height: height / 2,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(detailMeal.strMealThumb),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: BlocBuilder<FavouriteMealBloc,
                                    FavouriteMealState>(
                                  builder: (context, state) {
                                    final isFavourite =
                                        state is FoundFavouriteFood;
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          final event = isFavourite
                                              ? EventDeleteFavouriteMeal(
                                                  detailMeal.id)
                                              : EventAddFavouriteMeal(
                                                  detailMeal);
                                          context
                                              .read<FavouriteMealBloc>()
                                              .add(event);
                                        },
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: AppColors.black12,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: isFavourite
                                                    ? AppColors.pinkColor
                                                    : AppColors.whiteColor),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Icon(
                                              isFavourite
                                                  ? Icons.favorite
                                                  : Icons.favorite_outline,
                                              color: isFavourite
                                                  ? AppColors.pinkColor
                                                  : AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          MaterialContainer(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detailMeal.strMeal,
                                style: AppTextStyle.foodDetailTextStyle,
                              ),
                              Text(
                                "${detailMeal.strArea}, ${detailMeal.strCategory}",
                                style: AppTextStyle.foodDetailSecondTextStyle,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              (detailMeal.strTags == "-")
                                  ? const SizedBox()
                                  : Text(
                                      "Suitable : ${detailMeal.strTags}",
                                      style: AppTextStyle
                                          .foodDetailSecondTextStyle
                                          .copyWith(fontSize: 12),
                                    ),
                              const Divider(
                                thickness: 2,
                              ),
                              Text(
                                "INGREDIENTS",
                                style:
                                    AppTextStyle.foodDetailTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              TextSentencesPattern(detailMeal: detailMeal),
                              const Divider(
                                thickness: 2,
                              ),
                              Text(
                                "INSTRUCTIONS",
                                style: AppTextStyle.containerTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                detailMeal.strInstructions,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              (detailMeal.strYoutube == "")
                                  ? const SizedBox()
                                  : ElevatedButton(
                                      onPressed: () async {
                                        Uri uri =
                                            Uri.parse(detailMeal.strYoutube);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                            'Failed to open Video',
                                          )));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.backgroundColors,
                                        foregroundColor:
                                            AppColors.darkBlackColors,
                                        fixedSize: Size(width, 50),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      child: const Text(
                                        "WATCHING VIDEO TUTORIAL",
                                      )),
                                    const SizedBox(height: 30,),
                            ],
                          ))
                        ],
                      );
                    }
                    return const Center(
                      child: Text("INIT"),
                    );
                  },
                ),
              ),
              const ArrowBackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
