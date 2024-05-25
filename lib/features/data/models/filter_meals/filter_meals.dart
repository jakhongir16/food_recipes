class FilterMeals {
  String id;
  String mealTitle;
  String mealThumb;

  FilterMeals({
    required this.id,
    required this.mealTitle,
    required this.mealThumb,
  });

  factory FilterMeals.fromJson(Map<String, dynamic> json) => FilterMeals(
      id: json["idMeal"] ?? "",
      mealTitle: json["strMeal"] ?? "",
      mealThumb: json["strMealThumb"] ?? "",
  );

   Map<String, dynamic> toJson() => {
    "id": id,
    "mealTitle": mealTitle,
    "mealThumb": mealThumb,
   };
}