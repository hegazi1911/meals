
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/Model/categories_model.dart';
import 'package:meals/view/Screen%20Bottom%20Navigationbar/favorite_screen.dart';
import 'package:meals/view/Screen%20Bottom%20Navigationbar/profile.dart';
import 'package:meals/widgets/categories_view.dart';


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
     String? id;

  CategoriesModel? categoriesModel;
  int CurrentIndex = 0 ; 
final Screen = [
CategoriesView(),
FavoriteScreen(),
ProfileScreen()

] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.orange,
        type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.white,
       iconSize: 30,
       showUnselectedLabels: false,
       unselectedItemColor: Color.fromARGB(255, 255, 224, 177),
        currentIndex: CurrentIndex,
        onTap: (index) => setState(() => CurrentIndex = index ) ,
        items: const [BottomNavigationBarItem(
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
