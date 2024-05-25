import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipes/constants/rest_api/constants.dart';
import 'package:food_recipes/core/error/server_error.dart';

import '../../../../core/either_dart/either_dart.dart';
import '../../../../core/error/failure.dart';
import '../../../data/models/all_ingredients/all_ingredients.dart';

part 'package:food_recipes/features/domain/remote/all_ingredients_repo/all_ingredients_repository_impl.dart';

abstract class AllIngredientsRepository {
  Future<Either<Failure, List<AllIngredients>>> obtainAllIngredients();
}