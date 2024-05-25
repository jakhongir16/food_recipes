import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/features/domain/remote/search_meal_repository/search_meal_repository.dart';


import '../../../data/models/filter_meals/filter_meals.dart';

part 'search_meal_event.dart';

part 'search_meal_state.dart';

class SearchMealBloc extends Bloc<SearchMealEvent, SearchMealState> {
  SearchMealBloc(this.searchMealRepository) : super(const SearchMealState()) {
    on<EventSearchMeal>(_searchMealQuery);
  }

  final SearchMealRepository searchMealRepository;

  Future<void> _searchMealQuery(
      EventSearchMeal event, Emitter<SearchMealState> emit) async {
    emit(state.copyWith(searchStatus: SearchStatus.searchLoading));



      final result = await searchMealRepository.searchMeal(event.searchMeal);

    result.either(

          (left) => emit(state.copyWith(searchStatus: SearchStatus.searchError)),

          (right) => emit(
            state.copyWith(searchMeal: right, searchStatus: SearchStatus.searchSuccess),
          ),
    );
  }
  }

