import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/features/data/models/all_categories_meals/all_categories_meals.dart';
import 'package:food_recipes/features/data/models/detail_food/detail_food.dart';
import 'package:food_recipes/features/domain/remote/home_repository/home_repository.dart';

import '../../../../core/model/status_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(const HomeState()) {
    on<HomeCookingIdeaEvent>(_receiveRandomFood);
    on<EventAllCategories>(_implementCategoryFood);
  }
  final HomeRepository homeRepository;
  Future<void> _receiveRandomFood(
      HomeCookingIdeaEvent event, Emitter<HomeState> emit) async {
      emit(state.copyWith(status: Status.loading));
      final result = await homeRepository.getRandomFood();
      result.either(
          (left) => emit(state.copyWith(
            status: Status.error,)),
          (right) => emit(state.copyWith(random: right, status: Status.success)));
  }

  Future<void> _implementCategoryFood(EventAllCategories event, Emitter<HomeState> emit) async {
     emit(state.copyWith(status: Status.loading));
     final result = await homeRepository.getAllCategoriesFood();
     result.either(
         (left) => emit(state.copyWith(
           status: Status.error,
         )),
         (right) => emit(state.copyWith(foodCategories: right, status: Status.success)),
     );
  }


}
