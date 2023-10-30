import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/riverpod/change_notifire_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';

final iconnotifier = ChangeNotifierProvider<favoritecolor>((ref) {
  return favoritecolor();
});

class CustomCardDD extends ConsumerWidget {
  MealModel mealModel;
  CustomCardDD({
    super.key,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconc = ref.watch(iconnotifier);
 final favorite =  Hive.box<MealHiveModel>('favorite') ; 

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () async{
                          if (mealModel.isFavorite == true) {
                            iconc.addToFavorite(mealModel, false);

                          } else {
                            iconc.addToFavorite(mealModel, true);
                           await favorite.add(MealHiveModel(idMeal: mealModel.idMeal , 
                            strMeal: mealModel.strMeal ,
                             strMealThumb: mealModel.strMealThumb , 
                             isFavorite: mealModel.isFavorite));
                          }
                        },
                        icon:mealModel.isFavorite!
                        ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                        : Icon(Icons.favorite_border,
                            color: Color(0xFFEF7532))

                        
                        ),
                    
                  ])),
          Hero(
            
              tag: "imgPath",
              child: Container(
                  height: 75.0,
                  width: 100.0,
                  child: Image.network(mealModel.strMealThumb!, fit:BoxFit.contain ,width: 100,),
                  )),
          SizedBox(height: 70.0),
         
          Text(mealModel.strMeal!,
              style: TextStyle(
                    overflow: TextOverflow.ellipsis,

                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 19.0)),
          
        ]));
    
  }
}
