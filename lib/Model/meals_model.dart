import 'package:hive_flutter/hive_flutter.dart';
part 'meals_model.g.dart';
@HiveType(typeId: 0)
class MealModel extends HiveObject{
  @HiveField(0)
  final String? strMeal;
    @HiveField(1)
  final String? strMealThumb;
    @HiveField(2)
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
