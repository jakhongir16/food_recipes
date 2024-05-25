import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/features/domain/remote/all_ingredients_repo/all_ingredients_repository.dart';

import '../../../../core/model/status_model.dart';
import '../../../data/models/all_ingredients/all_ingredients.dart';

part 'meal_ingredient_event.dart';
part 'meal_ingredient_state.dart';

class MealIngredientBloc extends Bloc<MealIngredientEvent, MealIngredientState> {
  MealIngredientBloc(this.allIngredientsRepository) : super(const MealIngredientState()) {
    on<EventMealIngredient>(_justObtainAllIngredients);
  }

  final AllIngredientsRepository allIngredientsRepository;

  Future<void> _justObtainAllIngredients(EventMealIngredient event, Emitter<MealIngredientState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await allIngredientsRepository.obtainAllIngredients();
    result.either(
        (left) => emit(state.copyWith(
          status: Status.error,
        )),
        (right) => emit(state.copyWith(allIngredients: right, status: Status.success)),
    );
  }
}
