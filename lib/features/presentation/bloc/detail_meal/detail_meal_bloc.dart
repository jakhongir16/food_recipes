import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/model/status_model.dart';
import '../../../data/models/detail_food/detail_food.dart';
import '../../../domain/remote/detail_food_rep/detail_food_repository.dart';

part 'detail_meal_event.dart';
part 'detail_meal_state.dart';

class DetailMealBloc extends Bloc<DetailMealEvent, DetailMealState> {
  DetailMealBloc(this.detailFoodRepository) : super(const DetailMealState()) {
    on<EventDetailMeal>(_receiveMealDetail);
  }

  final DetailFoodRepository detailFoodRepository;

  Future<void> _receiveMealDetail(EventDetailMeal event, Emitter<DetailMealState> emit) async {
     emit(state.copyWith(status: Status.loading));

     final result = await detailFoodRepository.getDetailFood(event.idMeal);

     result.either(
         (left) => emit(state.copyWith(
           status: Status.error,
         )),
         (right) => emit(state.copyWith(mealDetail: right, status: Status.success)),
     );
  }
}
