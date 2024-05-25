part of 'meal_ingredient_bloc.dart';

abstract class MealIngredientEvent extends Equatable {
  const MealIngredientEvent();
}

class EventMealIngredient extends MealIngredientEvent {
  const EventMealIngredient();

  @override
  List<Object?> get props => [];
}
