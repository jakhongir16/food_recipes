class AllCategoriesMeals {
  String id;
  String strCategory;
  String strCategoryThumb;

  AllCategoriesMeals({
  required this.id,
  required this.strCategory,
  required this.strCategoryThumb,
  });

  factory AllCategoriesMeals.fromJson(Map<String, dynamic> json) =>
      AllCategoriesMeals(
          id: json["idCategory"] ?? "",
          strCategory: json["strCategory"] ?? "",
          strCategoryThumb: json["strCategoryThumb"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "strCategory": strCategory,
    "strCategoryThumb": strCategoryThumb,
  };

  AllCategoriesMeals copyWith({
    String? id,
    String? strCategory,
    String? strCategoryThumb
}) => AllCategoriesMeals(
      id: id ?? this.id,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb
  );
}