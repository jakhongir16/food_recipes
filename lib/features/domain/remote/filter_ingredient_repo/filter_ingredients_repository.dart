import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipes/constants/rest_api/constants.dart';
import 'package:food_recipes/core/error/server_error.dart';

import '../../../../core/either_dart/either_dart.dart';
import '../../../../core/error/failure.dart';
import '../../../data/models/filter_meals/filter_meals.dart';

part 'filter_ingredients_repository_impl.dart';


abstract class FilterIngredientsRepository {
  Future<Either<Failure, List<FilterMeals>>> filterIngredient(String ingredient);


}