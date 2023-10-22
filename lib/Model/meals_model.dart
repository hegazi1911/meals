class MealModel {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  MealModel({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory MealModel.fromJson(Map<String, dynamic> jsonData) {
    return MealModel(
      strMeal: jsonData['strMeal'],
      strMealThumb: jsonData['strMealThumb'],
      idMeal: jsonData['idMeal'],
    );
  }
}
