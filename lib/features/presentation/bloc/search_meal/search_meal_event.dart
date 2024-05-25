part of 'search_meal_bloc.dart';

abstract class SearchMealEvent extends Equatable {
  const SearchMealEvent();
}

class EventSearchMeal extends SearchMealEvent {
  final String searchMeal;

  const EventSearchMeal(this.searchMeal);

  @override
  List<Object?> get props => [searchMeal];
}