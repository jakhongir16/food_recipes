class MealCountry {
  String strArea;

  MealCountry({required this.strArea});

  factory MealCountry.fromJson(Map<String, dynamic> json) => MealCountry(
      strArea: json["strArea"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "strArea":strArea,
  };

  MealCountry copyWith({
    String? strArea,
  }) => MealCountry(
      strArea: strArea ?? this.strArea,

  );
}