import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:food_recipes/core/error/server_error.dart';
import 'package:food_recipes/features/data/models/meal_country/meal_country.dart';

import '../../../../constants/rest_api/constants.dart';
import '../../../../core/either_dart/either_dart.dart';
import '../../../../core/error/failure.dart';


part 'package:food_recipes/features/domain/remote/food_country_repository/food_country_repository_impl.dart';

abstract class FoodCountryRepository {
  Future<Either<Failure, List<MealCountry>>> getMealCountry();
}