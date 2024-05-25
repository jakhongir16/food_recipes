part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = Status.loading,
    this.random,
    this.foodCategories = const [],
});

  final Status status;
  final DetailFood? random;
  final List<AllCategoriesMeals> foodCategories;

  HomeState copyWith({
    Status? status,
    DetailFood? random,
    List<AllCategoriesMeals>? foodCategories,
  }) {
    return HomeState(
      status: status ?? this.status,
      random: random ?? this.random,
      foodCategories: foodCategories ?? this.foodCategories,
    );
  }

  @override
  List<Object?> get props => [status, random, foodCategories];
}