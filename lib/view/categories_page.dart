import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/Model/categories_model.dart';
import 'package:meals/Services/get_all_categories.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_card.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({
    super.key,
    this.id,
  });
  final String? id;


  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesModel? categoriesModel;
  int CurrentIndex = 0 ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoriesView(
        id: widget.id,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: CurrentIndex,
        onTap: (index) => setState(() => CurrentIndex = index ) ,
        items: [BottomNavigationBarItem(
          icon:FaIcon(FontAwesomeIcons.house),
        label: "Home" , 
        backgroundColor: Colors.orange ) , 
        BottomNavigationBarItem(
          icon:FaIcon(FontAwesomeIcons.heart),
        label: "Favorite" , 
        backgroundColor: Colors.orange , 

        
        ), BottomNavigationBarItem(
          icon:FaIcon(FontAwesomeIcons.user),
        label: "Profile" , 
        backgroundColor: Colors.orange , 

        
        )
        
        ]),
    );
  }
}

class categoriesView extends StatelessWidget {
  categoriesView({super.key, this.categoriesModel, required this.id});
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
                    childAspectRatio: 1,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 0.5),
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
