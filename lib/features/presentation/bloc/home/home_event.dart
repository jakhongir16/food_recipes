part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeCookingIdeaEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class EventCookingIdea extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class EventAllCategories extends HomeEvent {
  @override
  List<Object?> get props => [];
}