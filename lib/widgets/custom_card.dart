import 'package:flutter/material.dart';
import 'package:meals/Model/categories_model.dart';

class customCard extends StatelessWidget {
  customCard({super.key, required this.categoriesModel});
  CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
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
                      Text(
                        categoriesModel.strCategory!,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categoriesModel.strCategoryDescription!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            left: 80,
            bottom: 130,
            child: Image.network(
              categoriesModel.strCategoryThumb!,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
