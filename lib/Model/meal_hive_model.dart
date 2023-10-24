import 'package:hive_flutter/hive_flutter.dart';
part 'meal_hive_model.g.dart';
@HiveType(typeId: 0)
class MealHiveModel extends HiveObject{
  @HiveField(0)
  final String? strMeal;
    @HiveField(1)
  final String? strMealThumb;
    @HiveField(2)
  final String? idMeal;
    @HiveField(3)
     bool? isFavorite = true;

  MealHiveModel({
    this.isFavorite, 
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  // factory MealHiveModel.fromMealModel(MealModel mealModel) {
  //   return MealHiveModel(
  //     strMeal: mealModel.strMeal,
  //     strMealThumb: mealModel.strMealThumb,
  //     idMeal: mealModel.idMeal ,
  //   );
  }
// }
