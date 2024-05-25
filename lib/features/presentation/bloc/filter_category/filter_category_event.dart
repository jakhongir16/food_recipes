part of 'filter_category_bloc.dart';

abstract class FilterCategoryEvent extends Equatable {
  const FilterCategoryEvent();
}

class EventMealCategory extends FilterCategoryEvent {
  const EventMealCategory(this.categoryName);

  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}