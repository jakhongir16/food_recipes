import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipes/constants/rest_api/constants.dart';
import 'package:food_recipes/core/error/server_error.dart';
import 'package:food_recipes/features/data/models/filter_meals/filter_meals.dart';

import '../../../../core/either_dart/either_dart.dart';
import '../../../../core/error/failure.dart';

part 'search_meal_repository_impl.dart';

abstract class SearchMealRepository {
  Future<Either<Failure, List<FilterMeals>>> searchMeal(String meal);
}