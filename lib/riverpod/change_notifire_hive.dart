import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';

final listFavHiveProvider =
    StateNotifierProvider<FavoriteController, List<Map<String, dynamic>>>(
        (ref) {
  return FavoriteController();
}); 

class FavoriteController extends StateNotifier<List<Map<String, dynamic>>> {
  FavoriteController() : super([]);
 final favorite =  Hive.box<MealHiveModel>('favorite') ; 

  void removeFromFavHive(MealHiveModel mealHiveModel) {
    mealHiveModel.isFavorite = false ; 
    favorite.delete(mealHiveModel.idMeal) ; 
  }
}
