part of 'meal_country_bloc.dart';

class MealCountryState extends Equatable {
 const MealCountryState({
    this.status = Status.loading,
    this.mealCountry = const [],
 });

  final Status status;
  final List<MealCountry> mealCountry;

  MealCountryState copyWith({
   Status? status,
   List<MealCountry>? mealCountry,
}) {
    return MealCountryState(
      status: status ?? this.status,
      mealCountry: mealCountry ?? this.mealCountry,
    );
  }

  @override
  List<Object?> get props => [
    status,
    mealCountry,
  ];
}
