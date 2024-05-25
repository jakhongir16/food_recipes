import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/model/status_model.dart';
import '../../../data/models/filter_meals/filter_meals.dart';
import '../../../domain/remote/country_filter/country_filter_repository.dart';

part 'detail_meal_country_event.dart';
part 'detail_meal_country_state.dart';

class DetailMealCountryBloc extends Bloc<DetailMealCountryEvent, DetailMealCountryState> {
  DetailMealCountryBloc(this.countryFilterRepository) : super(const DetailMealCountryState()) {
    on<EventDetailMealCountry>(_launchCountryFilterMeal);
  }
  final CountryFilterRepository countryFilterRepository;

  Future<void> _launchCountryFilterMeal(EventDetailMealCountry event, Emitter<DetailMealCountryState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await countryFilterRepository.getCountryFilterMeal(event.country);
    result.either(
        (left) => emit(state.copyWith(
          status: Status.error,
        )),
        (right) => emit(state.copyWith(getCountryFilterMeal: right, status: Status.success)),
    );
  }
}
