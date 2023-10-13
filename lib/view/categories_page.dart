import 'package:flutter/material.dart';
import 'package:meals/Model/categories_model.dart';
import 'package:meals/Services/get_all_categories.dart';

import '../widgets/custom_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoriesView(),
    );
  }
}

class categoriesView extends StatelessWidget {
  const categoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesModel>>(
        future: GetAllCategoriesServices().getallcategories(),
        builder: (context, snapshot) {
          List<CategoriesModel> categories = snapshot.data!;
          return GridView.builder(
              itemCount: categories.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 0.5),
              itemBuilder: (context, index) {
                return customCard(
                  categoriesModel: categories[index],
                );
              });
        });
  }
}
