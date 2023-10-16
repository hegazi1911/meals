import 'package:flutter/material.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/Services/get_all_meal.dart';
import 'package:meals/widgets/custom_card_meals.dart';
import 'package:go_router/go_router.dart';

import '../Model/categories_model.dart';

class MealsPage extends StatelessWidget {
  final String? id;
  const MealsPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealsView(),
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryId = routeArgs['id'];
    return FutureBuilder<List<MealModel>>(
        future: GetAllMeals().getallmeals(categories: categoryId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Display a loading indicator while the future is loading.
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Display an error message if the future encountered an error.
          } else if (snapshot.hasData) {
            // Use the data from the future to build your widget.
            final data = snapshot.data;
            List<MealModel> meals = snapshot.data!;
            return GridView.builder(
                itemCount: meals.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 0.5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String id = meals[index].idMeal!;
                      context.go('/detalies/$id');
                    },
                    child: CustomMealCard(
                      mealModel: meals[index],
                    ),
                  );
                });
            ;
          } else {
            return Text(
                'No data available'); // Handle the case when the future completes, but there's no data.
          }
        });
  }
}
