import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipes/constants/rest_api/constants.dart';

import 'package:food_recipes/core/either_dart/either_dart.dart';
import 'package:food_recipes/core/error/server_error.dart';
import 'package:food_recipes/features/data/models/detail_food/detail_food.dart';

import '../../../../core/error/failure.dart';
import '../../../data/models/all_categories_meals/all_categories_meals.dart';

part 'package:food_recipes/features/domain/remote/home_repository/home_repository_impl.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AllCategoriesMeals>>> getAllCategoriesFood();

  Future<Either<Failure, DetailFood>> getRandomFood();


}
