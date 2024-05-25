part of 'filter_category_bloc.dart';

class FilterCategoryState extends Equatable {
  const FilterCategoryState({
    this.status = Status.loading,
    this.categoryFilter = const [],
});

  final Status status;
  final List<FilterMeals> categoryFilter;

  FilterCategoryState copyWith({
    Status? status,
    List<FilterMeals>? categoryFilter,
}) {
    return FilterCategoryState(
      status: status ?? this.status,
      categoryFilter: categoryFilter ?? this.categoryFilter,
    );
  }

  @override
  List<Object?> get props => [status, categoryFilter];
}

