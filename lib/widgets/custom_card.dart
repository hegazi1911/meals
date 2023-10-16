import 'package:flutter/material.dart';
import 'package:meals/Model/categories_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.categoriesModel});
  CategoriesModel categoriesModel;

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
          Image.network(categoriesModel.strCategoryThumb!),
          Text(categoriesModel.strCategory!),
          Text(categoriesModel.strCategoryDescription!.substring(0, 40)),
        ],
      ),
    );
  }
}
