import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meals/Model/meal_hive_model.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/cubit/meals_cubit.dart';
import 'package:meals/hive/hive.dart';
import 'package:meals/Services/get_all_meal.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/widgets/custom_card_meals.dart';
import 'package:meals/widgets/meals_view.dart';

import '../Model/categories_model.dart';

class MealsPage extends StatelessWidget {
  final String? id;
  const MealsPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF545D68),
            ),
            onPressed: () {
              context.push('/categories/:id');
            },
          ),
          title: Text("Meals"),
          titleTextStyle: TextStyle(fontSize: 20, color: Color(0xFF545D68)),
        ),
        body: const MealsView());
  }
}
