import 'package:flutter/material.dart';
import 'package:meals/Model/categories_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.categoriesModel});
  CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white),
        child: Column(children: [
         
          Container(
              height: 100.0,
              width: 75.0,
              child: Image.network(categoriesModel.strCategoryThumb!),),
          SizedBox(height: 7.0),
          Text(categoriesModel.strCategory!,
              style: TextStyle(
                  color: Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 14.0)),
          Text(categoriesModel.strCategoryDescription!.substring(0, 15),
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0)),  
        ]));
    
  }
}
