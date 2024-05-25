sealed class AppContants {
  static const baseUrl = 'http://www.themealdb.com/api/json/v1/1';
  static const baseUrlImage = "http://www.themealdb.com/images/ingredients/";
}

sealed class Urls {
  Urls._();

  static const String getRandomFood = '/random.php';
  static const String getAllCategoriesFood = '/categories.php';
  static const String getFoodCountry = '/list.php?a=list';
  static const String getAllIngredient = '/list.php?i=list';
  static const String getCategoryFilterGood = '/filter.php?c=';
  static const String getCountryFilterFood = '/filter.php?a=';
  static const String getIngredientFilterFood = '/filter.php?i=';
  static const String searchFood = '/search.php?s=';
  static const String getDetailFood = '/lookup.php?i=';

}