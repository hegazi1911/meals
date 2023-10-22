import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';

Future<List<MealHiveModel>> fetchFavoriteMeals() async {
  final box = await Hive.openBox<MealHiveModel>('favorite');
  List<dynamic> dynamicList = box.values.toList();
  List<MealHiveModel> favoriteMeals = dynamicList.map((item) => item as MealHiveModel).toList();
  return favoriteMeals;
}
