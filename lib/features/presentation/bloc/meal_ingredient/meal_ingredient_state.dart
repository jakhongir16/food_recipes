part of 'meal_ingredient_bloc.dart';

class MealIngredientState extends Equatable {
  const MealIngredientState({
    this.status = Status.loading,
    this.allIngredients = const [],
});

  final Status status;
  final List<AllIngredients> allIngredients;

  MealIngredientState copyWith({
  Status? status,
  List<AllIngredients>? allIngredients
   }) {
    return MealIngredientState(
      status: status ?? this.status,
      allIngredients: allIngredients ?? this.allIngredients,
    );
  }

  @override
  List<Object?> get props => [status, allIngredients];
}

