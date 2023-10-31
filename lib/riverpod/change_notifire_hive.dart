import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
// import 'package:meals/Model/meal_hive_model.dart';
// import 'package:meals/Model/meals_model.dart';

// final listFavHiveProvider =
//     StateNotifierProvider<FavoriteController, List<Map<String, dynamic>>>(
//         (ref) {
//   return FavoriteController();
// }); 

// class FavoriteController extends StateNotifier<List<Map<String, dynamic>>> {
//   FavoriteController() : super([]);
//  final favorite =  Hive.box<MealHiveModel>('favorite') ; 

//   void removeFromFavHive(MealHiveModel mealHiveModel) {
//     favorite.delete(mealHiveModel.idMeal) ; 

//   }
// }
import 'package:flutter/material.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/hive/hive.dart';

class favoritecolor extends ChangeNotifier{ 
 var iconColor = Colors.black ; 
 void addToFavorite(MealModel mealModel , bool isFavorite){ 
mealModel.isFavorite = isFavorite ; 
  notifyListeners() ; 
 }
 void removeFavorite(MealHiveModel , bool isFavorite){ 
  MealHiveModel.isFavorite=isFavorite ; 
    fetchFavoriteMeals();

  notifyListeners() ; 
 }
}