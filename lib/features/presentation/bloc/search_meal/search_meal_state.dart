part of 'search_meal_bloc.dart';

class SearchMealState extends Equatable {
  const SearchMealState({
    this.searchStatus = SearchStatus.searchLoading,
    this.searchMeal = const [],
});

  final SearchStatus searchStatus;
  final List<FilterMeals> searchMeal;

  SearchMealState copyWith({
    SearchStatus? searchStatus,
    List<FilterMeals>? searchMeal,
}) {
    return SearchMealState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchMeal: searchMeal ?? this.searchMeal,
    );
  }

  @override
  List<Object?> get props =>  [searchStatus, searchMeal];
}

enum SearchStatus {
  initial,
  searchLoading,
  searchSuccess,
  searchError,
}

extension SearchStatusX on SearchStatus {
  bool get isInitial => this == SearchStatus.initial;

  bool get isLoading => this == SearchStatus.searchLoading;

  bool get isSuccess => this == SearchStatus.searchSuccess;

  bool get isError => this == SearchStatus.searchError;

}