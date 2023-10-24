import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';

final listFavProvider =
    StateNotifierProvider<FavoriteController, List<Map<String, dynamic>>>(
        (ref) {
  return FavoriteController();
});

class FavoriteController extends StateNotifier<List<Map<String, dynamic>>> {
  FavoriteController() : super([]);
 final favorite =  Hive.box<MealHiveModel>('favorite') ; 

  void addToFav( MealModel mealModel) {
    mealModel.isFavorite = true ; 
    
     favorite.put(mealModel.idMeal , MealHiveModel(idMeal: mealModel.idMeal , strMeal: mealModel.strMeal , strMealThumb: mealModel.strMealThumb ,isFavorite: mealModel.isFavorite));
       
   
  }

  void removeFromFav(MealModel mealModel) {
    mealModel.isFavorite = false ; 
    favorite.delete(mealModel.idMeal) ; 
  }
}
