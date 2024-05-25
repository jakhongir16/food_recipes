part of 'filter_ingredient_bloc.dart';

class FilterIngredientState extends Equatable {
  const FilterIngredientState({
    this.status = Status.loading,
    this.allMeals = const [],
});

  final Status status;
  final List<FilterMeals> allMeals;

  FilterIngredientState copyWith({
    Status? status,
    List<FilterMeals>? allMeals
}) {
    return FilterIngredientState(
      status: status ?? this.status,
      allMeals: allMeals ?? this.allMeals,
    );
  }

  @override
  List<Object?> get props => [status, allMeals];
}


