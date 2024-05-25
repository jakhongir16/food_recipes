import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/favorite_meal/favourite_meal_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/filter_category/filter_category_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/filter_ingredient/filter_ingredient_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/home/home_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/introduction/introduction_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/meal_ingredient/meal_ingredient_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/search_meal/search_meal_bloc.dart';
import 'package:food_recipes/features/presentation/pages/detail_food/detail_food_page.dart';
import 'package:food_recipes/features/presentation/pages/detail_food_category/detail_food_category_page.dart';
import 'package:food_recipes/features/presentation/pages/detail_food_ingredients/detail_food_ingredients_page.dart';
import 'package:food_recipes/features/presentation/pages/food_by_country/food_country_page.dart';

import '../../features/presentation/bloc/detail_meal_country/detail_meal_country_bloc.dart';
import '../../features/presentation/bloc/meal_country/meal_country_bloc.dart';
import '../../features/presentation/pages/detail_food_country/detail_food_country_page.dart';
import '../../features/presentation/pages/food_by_ingredients/food_ingredients_page.dart';
import '../../features/presentation/pages/introduction/introduction_page.dart';
import '../../features/presentation/pages/splash/splash_screen.dart';
import '../../get_it.dart';
import '../utils/widget/bottom_navigation_widget.dart';

class AppRoutes {
  final FavouriteMealBloc _favouriteMealBloc = sl<FavouriteMealBloc>();

  Route onRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/intro":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => sl<IntroductionBloc>(),
              child: const IntroductionPage()),
        );
      case "/home":
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => sl<HomeBloc>()
                          ..add(HomeCookingIdeaEvent())
                          ..add(EventAllCategories()),
                      ),
                      BlocProvider(
                        create: (context) => sl<SearchMealBloc>()
                      ),
                      BlocProvider.value(
                        value: _favouriteMealBloc,
                      ),
                    ],
                    // create: (context) => sl<HomeBloc>()
                    //   ..add(HomeCookingIdeaEvent())
                    //   ..add(EventAllCategories()),
                    child:
                    const BottomNavigationWidget()));
      case '/foodCountryPage':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) =>
                    sl<MealCountryBloc>()..add(EventMealCountry()),
                child: const FoodCountryPage()));

      case '/foodIngredientsPage':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) =>
                    sl<MealIngredientBloc>()..add(const EventMealIngredient()),
                child: const FoodIngredientsPage()));

      case '/detailFoodCategory':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<FilterCategoryBloc>(),
            child: DetailFoodCategoryPage(categoryName: args as String),
          ),
        );

      case '/detailFoodCountry':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<DetailMealCountryBloc>(),
                  child:
                      DetailFoodCountryPage(theNameOfCountry: args as String),
                ));

      case "/detailFood":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<DetailMealBloc>(),
              ),
              BlocProvider.value(value: _favouriteMealBloc),
            ],
            child: DetailFoodPage(
              idMeal: args as String,
            ),
          ),
        );

      case '/detailFoodIngredient':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<FilterIngredientBloc>(),
                  child: DetailFoodIngredientsPage(
                      nameOfIngredient: args as String),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
