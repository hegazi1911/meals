import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/cubit/meals_cubit.dart';
import 'package:meals/riverpod/change_notifire_hive.dart';

final iconnotifier = ChangeNotifierProvider<favoritecolor>((ref) {
  return favoritecolor();
});

class CustomhiveCardDD extends ConsumerWidget {
   CustomhiveCardDD({super.key , required this.mealHiveModel });
MealHiveModel? mealHiveModel ; 

  @override
  Widget build(BuildContext context ,  WidgetRef ref) {
 final iconc = ref.watch(iconnotifier);
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
                offset: const Offset(10, 10))
          ]),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text (
                      mealHiveModel!.strMeal!,
                              overflow: TextOverflow.ellipsis,
  

                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       IconButton(onPressed:(){
                        favorite.delete(mealHiveModel) ; 
                        iconc.removeFavorite(mealHiveModel , false);

                       }
                    ,
icon:const Icon(Icons.favorite , color:Colors.red,size: 32, ))
          
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
            mealHiveModel!.strMealThumb!,
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
  }

