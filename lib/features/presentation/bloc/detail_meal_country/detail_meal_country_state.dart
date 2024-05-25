part of 'detail_meal_country_bloc.dart';

class DetailMealCountryState extends Equatable {
  const DetailMealCountryState({
    this.status = Status.loading,
    this.getCountryFilterMeal = const [],
});

  final Status status;
  final List<FilterMeals> getCountryFilterMeal;

  DetailMealCountryState copyWith({
    Status? status,
    List<FilterMeals>? getCountryFilterMeal,
}) {
    return DetailMealCountryState(
      status: status ?? this.status,
      getCountryFilterMeal: getCountryFilterMeal ?? this.getCountryFilterMeal,
    );
  }

  @override
  List<Object?> get props => [status, getCountryFilterMeal];
}

