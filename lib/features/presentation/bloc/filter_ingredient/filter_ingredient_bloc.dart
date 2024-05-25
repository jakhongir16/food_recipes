import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/features/domain/remote/filter_ingredient_repo/filter_ingredients_repository.dart';

import '../../../../core/model/status_model.dart';
import '../../../data/models/filter_meals/filter_meals.dart';

part 'filter_ingredient_event.dart';
part 'filter_ingredient_state.dart';

class FilterIngredientBloc extends Bloc<FilterIngredientEvent, FilterIngredientState> {
  FilterIngredientBloc(this.filterIngredientsRepository) : super(const FilterIngredientState()) {
    on<EventDetailMealIngredient>(_receiveIngredientMeal);
  }
  final FilterIngredientsRepository filterIngredientsRepository;

  Future<void> _receiveIngredientMeal(EventDetailMealIngredient event, Emitter<FilterIngredientState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await filterIngredientsRepository.filterIngredient(event.ingredient);
    result.either(
        (left) => emit(state.copyWith(status: Status.error)),
        (right) => emit(state.copyWith(
            allMeals: right,
            status: Status.success)));
  }
}
