import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';

class customhiveCardDD extends StatelessWidget {
  customhiveCardDD({required this.mealHiveModel ,  } );
MealHiveModel mealHiveModel ; 
  @override
  Widget build(BuildContext context) {
 final favorite =  Hive.box<MealHiveModel>('favorite') ; 
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 220,
          height: 130,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10))
          ]),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text (
                      mealHiveModel.strMeal!,
                              overflow: TextOverflow.ellipsis,
  

                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                        FavoriteButton(
                          isFavorite: true,
                          
            valueChanged: (_isFavorite) {
             if(!_isFavorite){
              favorite.delete(mealHiveModel.idMeal );
             }
            },
          )
                      ],
                    )
                  ]),
            ),
          ),
        ),
        Positioned(
          left: 80,
          bottom: 160,
          child: Image.network(
            mealHiveModel.strMealThumb!,
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
