part of 'detail_meal_bloc.dart';

abstract class DetailMealEvent extends Equatable {
  const DetailMealEvent();
}

class EventDetailMeal extends DetailMealEvent {
  final String idMeal;

  const EventDetailMeal(this.idMeal);

  @override
  List<Object?> get props => [idMeal];
}