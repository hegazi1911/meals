import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meals/Model/meals_model.dart';
 var favorite =  Hive.box('favorite') ; 
MealModel? mealModel ; 
class IconNotifier extends ChangeNotifier {

  void addFavorite(MealModel mealModel) {
    favorite.put(mealModel.idMeal, mealModel); // Assume that id is a unique identifier of each meal
    notifyListeners();
  }

  void deleteFavorite(MealModel mealModel) {
    favorite.delete(mealModel.idMeal);
    notifyListeners();
  }
}


Widget getIcon(MealModel mealModel) {
    if (favorite.containsKey(mealModel.idMeal)) {
                IconNotifier().deleteFavorite(mealModel);

      return Icon(Icons.favorite, color: Colors.red);

    }
      IconNotifier().addFavorite(mealModel);

    return Icon(Icons.favorite_border);
  }

 void onFavoritePress(MealModel mealModel) {
  if (favorite.containsKey(mealModel.idMeal)) {
    IconNotifier().deleteFavorite(mealModel);
    return;
  }
  IconNotifier().addFavorite(mealModel);
}
