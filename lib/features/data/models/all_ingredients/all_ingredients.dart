class AllIngredients {
  String id;
  String strIngredient;

  AllIngredients({
  required this.id,
  required this.strIngredient,
  });

  factory AllIngredients.fromJson(Map<String, dynamic> json) => AllIngredients(
      id: json["idIngredient"] ?? "",
      strIngredient: json["strIngredient"] ?? "",
  );

  Map<String, dynamic> toJson() => {
     "id": id,
     "strIngredient": strIngredient,
  };
}