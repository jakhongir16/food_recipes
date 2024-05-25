import 'package:dio/dio.dart';

import 'package:food_recipes/constants/rest_api/constants.dart';
import 'package:food_recipes/features/domain/local/database_repo/database_repository.dart';
import 'package:food_recipes/features/domain/remote/all_ingredients_repo/all_ingredients_repository.dart';
import 'package:food_recipes/features/domain/remote/country_filter/country_filter_repository.dart';
import 'package:food_recipes/features/domain/remote/detail_food_rep/detail_food_repository.dart';
import 'package:food_recipes/features/domain/remote/filter_ingredient_repo/filter_ingredients_repository.dart';
import 'package:food_recipes/features/domain/remote/food_country_repository/food_country_repository.dart';
import 'package:food_recipes/features/domain/remote/home_repository/home_repository.dart';
import 'package:food_recipes/features/domain/remote/search_meal_repository/search_meal_repository.dart';
import 'package:food_recipes/features/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/detail_meal_country/detail_meal_country_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/favorite_meal/favourite_meal_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/filter_ingredient/filter_ingredient_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/home/home_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/introduction/introduction_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/meal_country/meal_country_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/meal_ingredient/meal_ingredient_bloc.dart';
import 'package:food_recipes/features/presentation/bloc/search_meal/search_meal_bloc.dart';
import 'package:get_it/get_it.dart';

import 'constants/db/dbFavorite.dart';
import 'features/domain/remote/filter_category_repository/filter_category_repository.dart';
import 'features/presentation/bloc/filter_category/filter_category_bloc.dart';



final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio()
  ..options = BaseOptions(
    baseUrl: AppContants.baseUrl,
    sendTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

 splashFeatures();

 homeFeatures();

 foodCountryFeatures();

 foodFilterCountryFeatures();

 detailFood();

 detailFoodFilter();

 detailFoodCategory();

 databaseRegister();

 mealFavourite();

 mealAllIngredients();

 searchMeals();

}


splashFeatures() {
  sl.registerFactory(IntroductionBloc.new);
}

homeFeatures() {
  sl
  ..registerFactory<HomeBloc>(() => HomeBloc(sl(),))
  ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        dio: sl(),
      ),
  );
}

foodCountryFeatures(){
  sl..registerFactory<MealCountryBloc>(() => MealCountryBloc(sl(),))
  ..registerLazySingleton<FoodCountryRepository>(
      () =>  FoodCountryRepositoryImpl(dio: sl(),
      ),
  );
}

foodFilterCountryFeatures(){
  sl..registerFactory<DetailMealCountryBloc>(() => DetailMealCountryBloc(sl(), ))
  ..registerLazySingleton<CountryFilterRepository>(
      () => CountryFilterRepositoryImpl(dio: sl()
      ),
  );
}

detailFood(){
  sl..registerFactory<DetailMealBloc>(() => DetailMealBloc(sl(),))
  ..registerLazySingleton<DetailFoodRepository>(
      () => DetailFoodRepositoryImpl(dio: sl(),
      ),
  );
}

databaseRegister(){
  sl.registerLazySingleton<DatabaseManager>(() => DatabaseManager.instance);
  sl.registerLazySingleton<DatabaseRepo>(() => DatabaseRepo());
}

mealFavourite(){
  sl.registerFactory(FavouriteMealBloc.new);
}

mealAllIngredients(){
  sl..registerFactory<MealIngredientBloc>(() => MealIngredientBloc(sl()))
  ..registerLazySingleton<AllIngredientsRepository>(
      () => AllIngredientsRepositoryImpl(dio: sl(),
      ),
  );
}

detailFoodFilter(){
  sl..registerFactory<FilterIngredientBloc>(() => FilterIngredientBloc(sl()))
   ..registerLazySingleton<FilterIngredientsRepository>(
       () => FilterIngredientsRepositoryImpl(dio: sl(),
       ),
   );
}

detailFoodCategory(){
  sl..registerFactory<FilterCategoryBloc>(() => FilterCategoryBloc(sl()))..
  registerLazySingleton<FilterCategoryRepository>(
      () => FilterCategoryRepositoryImpl(dio: sl(),
      ),
  );
}

searchMeals(){
  sl..registerFactory<SearchMealBloc>(() => SearchMealBloc(sl()))..
  registerLazySingleton<SearchMealRepository>(
      () => SearchMealRepositoryImpl(dio: sl())
  );

}