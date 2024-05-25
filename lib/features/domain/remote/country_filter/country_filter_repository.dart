import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../constants/rest_api/constants.dart';
import '../../../../core/either_dart/either_dart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_error.dart';
import '../../../data/models/filter_meals/filter_meals.dart';

part 'package:food_recipes/features/domain/remote/country_filter/country_filter_repository_impl.dart';

abstract class CountryFilterRepository {
  Future<Either<Failure, List<FilterMeals>>> getCountryFilterMeal(String country);
}