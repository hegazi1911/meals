import 'package:flutter/material.dart';
import 'package:meals/Model/categories_model.dart';
import 'package:meals/Model/meals_model.dart';

class CustomMealCard extends StatelessWidget {
  CustomMealCard({required this.mealModel});
  MealModel mealModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10))
          ]),
      child: Column(
        children: [
          Image.network(mealModel.strMealThumb ??
              '"https://www.themealdb.com/images/media/meals/1548772327.jpg"'),
          Text(mealModel.strMeal ?? "error"),
        ],
      ),
    );
  }
}
