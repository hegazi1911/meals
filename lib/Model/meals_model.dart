class MealModel {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;
   bool? isFavorite  = false;

  MealModel(
    { 
  this.isFavorite, 

    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory MealModel.fromJson(Map<String, dynamic> jsonData) {
    return MealModel(
      isFavorite: false,
      strMeal: jsonData['strMeal'],
      strMealThumb: jsonData['strMealThumb'],
      idMeal: jsonData['idMeal'],
    );
  }
}
