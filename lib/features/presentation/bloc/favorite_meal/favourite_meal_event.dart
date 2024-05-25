part of 'favourite_meal_bloc.dart';

abstract class FavouriteMealEvent extends Equatable {
  const FavouriteMealEvent();
}

class EventAddFavouriteMeal extends FavouriteMealEvent {
  final DetailFood detailMeal;

  const EventAddFavouriteMeal(this.detailMeal);

  @override
  List<Object?> get props => [detailMeal];
}

class EventFoundFavouriteMeal extends FavouriteMealEvent {
  final String idMeal;

  const EventFoundFavouriteMeal(this.idMeal);

  @override
  List<Object?> get props => [idMeal];
}

class EventGetAllFavouriteMeal extends FavouriteMealEvent {
  @override
  List<Object?> get props => [];
}

class EventUpdateFavouriteMeal extends FavouriteMealEvent {
  @override
  List<Object?> get props => [];
}

class EventDeleteFavouriteMeal extends FavouriteMealEvent {
  final String idMeal;

  const EventDeleteFavouriteMeal(this.idMeal);

  @override
  List<Object?> get props => [idMeal];
}

