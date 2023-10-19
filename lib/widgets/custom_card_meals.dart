import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/RivirPod/changenotifair.dart';

class customCardDD extends StatelessWidget {
  customCardDD({required this.mealModel ,  } );
  MealModel mealModel;
  @override
  Widget build(BuildContext context) {
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
                      mealModel.strMeal!,
                              overflow: TextOverflow.ellipsis,
  

                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                        FavoriteButton(
                          isFavorite: false,
            valueChanged: (_isFavorite) async{
              if(_isFavorite == true) { 
                     await favorite.delete(mealModel);

              }else{
                   await favorite.add( mealModel);

              }
              print('Is Favorite $_isFavorite)');
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
            mealModel.strMealThumb!,
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
