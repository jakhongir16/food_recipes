import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/model/status_model.dart';
import '../../../data/models/filter_meals/filter_meals.dart';
import '../../../domain/remote/filter_category_repository/filter_category_repository.dart';

part 'filter_category_event.dart';
part 'filter_category_state.dart';

class FilterCategoryBloc extends Bloc<FilterCategoryEvent, FilterCategoryState> {
  FilterCategoryBloc(this.filterCategoryRepository) : super(const FilterCategoryState()) {
    on<EventMealCategory>(_categoryFilterMeal);
  }
  final FilterCategoryRepository filterCategoryRepository;

  Future<void> _categoryFilterMeal(EventMealCategory event, Emitter<FilterCategoryState> emit) async {
   emit(state.copyWith(status: Status.loading));

   final result = await filterCategoryRepository.filterMealCategory(event.categoryName);

   result.either(
       (left) => emit(state.copyWith(status: Status.error)),
       (right) => emit(state.copyWith(categoryFilter: right, status: Status.success)),
   );
  }
}
