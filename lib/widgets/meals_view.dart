import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/Services/get_all_meal.dart';
import 'package:meals/widgets/custom_card_meals.dart';

class MealsView extends StatelessWidget {
   const MealsView({super.key });

  @override
  Widget build(BuildContext context ) {
        final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryId = routeArgs['id'];
    return 
    FutureBuilder<List<MealModel>>(
        future: GetAllMeals().getallmeals(categories: categoryId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Display a loading indicator while the future is loading.
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Display an error message if the future encountered an error.
          } else if (snapshot.hasData) {
            // Use the data from the future to build your widget.
            List<MealModel> meals = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.only(top: 90),
              child: GridView.builder(
                itemCount: meals.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:0.8,
                    // crossAxisSpacing: 0.5,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0 , 
                     ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String id = meals[index].idMeal!;
                      context.go('/detalies/$id');
                    },
                    child: CustomCardDD(
                
                      mealModel: meals[index],
                      
                    ),
                  );
                }),
            );
            ;
          } else {
            return const Text(
                'No data available'); // Handle the case when the future completes, but there's no data.
          }
        });
  }
}
