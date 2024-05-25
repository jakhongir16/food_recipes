part of 'filter_ingredient_bloc.dart';

abstract class FilterIngredientEvent extends Equatable {
  const FilterIngredientEvent();
}

class EventDetailMealIngredient extends FilterIngredientEvent {
  final String ingredient;

  const EventDetailMealIngredient(this.ingredient);

  @override
  List<Object?> get props => [ingredient];

}
