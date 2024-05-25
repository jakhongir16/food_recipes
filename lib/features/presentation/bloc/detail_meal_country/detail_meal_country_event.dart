part of 'detail_meal_country_bloc.dart';

abstract class DetailMealCountryEvent extends Equatable {
  const DetailMealCountryEvent();
}

class EventDetailMealCountry extends DetailMealCountryEvent {
  final String country;

 const EventDetailMealCountry(this.country);

  @override
  List<Object?> get props => [country];
}