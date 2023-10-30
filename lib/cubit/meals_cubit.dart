import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meta/meta.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {

  MealsCubit() : super(MealsInitial());
        

   final favorite =  Hive.box<MealHiveModel>('favorite') ; 
    addToFav(MealModel mealModel) async{
    mealModel.isFavorite= true ; 
   await  favorite.add(MealHiveModel(idMeal: mealModel.idMeal , strMeal: mealModel.strMeal , strMealThumb: mealModel.strMealThumb ,isFavorite: mealModel.isFavorite));
  emit(MealsSucces());


  }
removfav(MealModel mealModel)async{
mealModel.isFavorite = false ; 
await favorite.delete(MealHiveModel(idMeal: mealModel.idMeal , strMeal: mealModel.strMeal , strMealThumb: mealModel.strMealThumb ,isFavorite: mealModel.isFavorite));

emit(MealsSucces());

  }

}
  


