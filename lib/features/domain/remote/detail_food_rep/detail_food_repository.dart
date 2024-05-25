import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipes/constants/rest_api/constants.dart';
import 'package:food_recipes/core/error/server_error.dart';

import '../../../../core/either_dart/either_dart.dart';
import '../../../../core/error/failure.dart';
import '../../../data/models/detail_food/detail_food.dart';

part 'package:food_recipes/features/domain/remote/detail_food_rep/detail_food_repository_impl.dart';

abstract class DetailFoodRepository {
  Future<Either<Failure, DetailFood>> getDetailFood(String id);
}