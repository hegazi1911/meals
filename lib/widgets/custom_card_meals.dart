import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/hive/hive.dart';
import 'package:meals/riverpod/change_notifire.dart';

class customCardDD extends ConsumerWidget {
  customCardDD( {required this.mealModel , } );
  MealModel mealModel;

  @override
  Widget build(BuildContext context , WidgetRef ref)  {
    MealHiveModel? mealHiveModel ; 
        final listFav = ref.watch(listFavProvider);

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
                      mealModel.strMeal!,
                              overflow: TextOverflow.ellipsis,
  

                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       IconButton(onPressed: 
                       mealModel.isFavorite!
                       
                              ? () {
                                        ref
                                            .read(listFavProvider.notifier)
                                            .removeFromFav(mealModel);
                                    }
                                  : () {
                                      ref
                                          .read(listFavProvider.notifier)
                                          .addToFav(mealModel);
                                    },
                        icon:mealModel.isFavorite! ? const Icon(
                                      Icons.favorite,
                                      size: 32,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_outline,
                                      size: 32,
                                      color: Colors.grey.shade600,
                                    ),)
                       
          //               FavoriteButton(
          //                 isFavorite:false, 
                          
          //   valueChanged: (_isFavorite) {
          //    if(_isFavorite){
          //     favorite.put(mealModel.idMeal , MealHiveModel(idMeal: mealModel.idMeal , strMeal: mealModel.strMeal , strMealThumb: mealModel.strMealThumb ,isFavorite: mealModel.isFavorite));
              
          //    }
          //   },
          // )
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
