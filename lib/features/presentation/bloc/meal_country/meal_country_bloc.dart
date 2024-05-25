import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/features/domain/remote/food_country_repository/food_country_repository.dart';

import '../../../../core/model/status_model.dart';
import '../../../data/models/meal_country/meal_country.dart';

part 'meal_country_event.dart';
part 'meal_country_state.dart';

class MealCountryBloc extends Bloc<MealCountryEvent, MealCountryState> {
  MealCountryBloc(this.foodCountryRepository) : super(const MealCountryState()) {
    on<EventMealCountry>(_implementCountryFood);
  }
  final FoodCountryRepository foodCountryRepository;
  Future<void> _implementCountryFood(EventMealCountry event, Emitter<MealCountryState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await foodCountryRepository.getMealCountry();
    result.either(
        (left) => emit(state.copyWith(
          status: Status.error,
        )),
        (right) => emit(state.copyWith(mealCountry: right, status: Status.success),),
    );
  }
}
