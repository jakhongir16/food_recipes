import 'package:sqflite/sqflite.dart';

import '../../../../constants/db/dbFavorite.dart';
import '../../../data/models/detail_food/detail_food.dart';

class DatabaseRepo {
  DatabaseManager dbManager = DatabaseManager.instance;

  Future<void> addFavorite(DetailFood detailMeal) async {
    Database db = await dbManager.db;

    var result = await db.insert(
      "favourite",
      {
        "id_meal": detailMeal.id,
        "meal_name": detailMeal.strMeal,
        "meal_thumb": detailMeal.strMealThumb,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Map<String, dynamic>>> getAllFavorite() async {
    Database db = await dbManager.db;

    List<Map<String, dynamic>> allFavourite = await db.query("favourite");
    if(allFavourite.isEmpty){
      return [];
    } else {
      return allFavourite;
    }
  }

  Future<Map<String, dynamic>?> getFoundFavourite(String idMeal) async {
    Database db = await dbManager.db;

    List<Map<String, dynamic>> foundFavourite = await db.query(
      "favourite",
      where: "id_meal = $idMeal",
    );
    if(foundFavourite.isEmpty){
      return null;
    } else {
      return foundFavourite[0];
    }
  }

  Future<void> deleteFavouriteFood(String idMeal) async {
    Database db = await dbManager.db;

    await db.delete("favourite", where: "id_meal = $idMeal");
  }
}