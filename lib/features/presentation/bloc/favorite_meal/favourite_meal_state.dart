part of 'favourite_meal_bloc.dart';

abstract class FavouriteMealState extends Equatable {
  const FavouriteMealState();

  @override
  List<Object?> get props => [];
}

class FavouriteFoodInitial extends FavouriteMealState {}

class FavouriteFoodLoading extends FavouriteMealState {}

class FoundFavouriteFood extends FavouriteMealState {}

class SuccessAddFavouriteFood extends FavouriteMealState {}

class SuccessGetAllFavouriteFood extends FavouriteMealState {
  final List<Map<String, dynamic>> allFavouriteFood;

  const SuccessGetAllFavouriteFood(this.allFavouriteFood);

//   SuccessGetAllFavouriteFood copyWith({
//   List<Map<String, dynamic>>? allFavouriteFood,
// }) {
//    return SuccessGetAllFavouriteFood(
//     allFavouriteFood : allFavouriteFood ?? this.allFavouriteFood,
//    );
//   }

  @override
  List<Object?> get props => [allFavouriteFood];
}

class SuccessDeleteFavouriteFood extends FavouriteMealState {}