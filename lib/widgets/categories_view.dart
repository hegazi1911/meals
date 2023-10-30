import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/Model/categories_model.dart';
import 'package:meals/Services/get_all_categories.dart';
import 'package:meals/widgets/custom_card.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key, this.categoriesModel,  this.id});
  CategoriesModel? categoriesModel;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesModel>>(
        future: GetAllCategoriesServices().getallcategories(),
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
            List<CategoriesModel> categories = snapshot.data!;
            return GridView.builder(
                itemCount: categories.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                    crossAxisSpacing: .5,
                    mainAxisSpacing: 1.5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String id = categories[index].strCategory!;
                      context.go('/Meals/$id');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24 , vertical: 24) ,
                      child: CustomCard(
                        categoriesModel: categories[index],
                      ),
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
