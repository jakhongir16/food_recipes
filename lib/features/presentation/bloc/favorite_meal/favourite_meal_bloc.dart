import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/features/domain/local/database_repo/database_repository.dart';

import '../../../data/models/detail_food/detail_food.dart';

part 'favourite_meal_event.dart';
part 'favourite_meal_state.dart';

class FavouriteMealBloc extends Bloc<FavouriteMealEvent, FavouriteMealState> {
  FavouriteMealBloc() : super(FavouriteFoodInitial()) {
    final _favRepos = DatabaseRepo();
    on<EventAddFavouriteMeal>((event, emit) async {
      await _favRepos.addFavorite(event.detailMeal);
      emit(SuccessAddFavouriteFood());
      await _favRepos.getFoundFavourite(event.detailMeal.id);
      emit(FoundFavouriteFood());
    });
    on<EventGetAllFavouriteMeal>((event, emit) async {
      emit(FavouriteFoodLoading());
      List<Map<String, dynamic>> allFavouriteFood = await _favRepos.getAllFavorite();
      if(allFavouriteFood.isEmpty) {
        emit(FavouriteFoodInitial());
      } else {
        emit(SuccessGetAllFavouriteFood(allFavouriteFood));
      }
    });
    on<EventFoundFavouriteMeal>((event, emit) async {
      Map<String, dynamic>? favMeal = await _favRepos.getFoundFavourite(event.idMeal);
      if(favMeal == null) {
        emit(FavouriteFoodInitial());
      } else {
        emit(FoundFavouriteFood());
      }
    });
    on<EventDeleteFavouriteMeal>((event, emit) async {
      await _favRepos.deleteFavouriteFood(event.idMeal);
      emit(SuccessDeleteFavouriteFood());
      await _favRepos.getFoundFavourite(event.idMeal);
      emit(FavouriteFoodInitial());
      List<Map<String, dynamic>> allFavouriteFood = await _favRepos.getAllFavorite();
      if(allFavouriteFood.isEmpty) {
        emit(FavouriteFoodInitial());
      } else {
        emit(SuccessGetAllFavouriteFood(allFavouriteFood));
      }
    });
  }


}
