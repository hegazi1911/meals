import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meals/Model/categories_model.dart';
import 'package:meals/Model/detalies_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/hive/hive.dart';
import 'package:meals/widgets/decrabtion_text_fild.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class CustomDetalies extends StatefulWidget {
   CustomDetalies({super.key , required this.detaliesModel});
DetaliesModel detaliesModel ;

  @override
  State<CustomDetalies> createState() => _CustomDetaliesState();
}

class _CustomDetaliesState extends State<CustomDetalies> {


  @override
  Widget build(BuildContext context) {
    return Container(
     
child: Column(children: [
  SizedBox(height: 16,) , 
 carddetalesmeal(detaliesModel: widget.detaliesModel,),
SizedBox(height: 18,), 
Container(
    decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, style: BorderStyle.solid ),
          boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10))
          ]),
  child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: 
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              Column(
              
                children: [
                  Text(widget.detaliesModel.strIngredient1! ,style: TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold),),
                  Text(widget.detaliesModel.strIngredient2! , style: TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                  Text(widget.detaliesModel.strIngredient3!, style: TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                  Text(widget.detaliesModel.strIngredient4! ,  style: TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                   Text(widget.detaliesModel.strIngredient5! , style: TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text(widget.detaliesModel.strMeasure1! ,  style: TextStyle(fontSize: 20),),
                  Text(widget.detaliesModel.strMeasure2!,  style: TextStyle(fontSize: 20)),
                  Text(widget.detaliesModel.strMeasure3!, style: TextStyle(fontSize: 20)),
                  Text(widget.detaliesModel.strMeasure4! ,  style: TextStyle(fontSize: 20)),
                  Text(widget.detaliesModel.strMeasure5! ,  style: TextStyle(fontSize: 20)),
        
                ],
              )
            ],
          ),
        ) , 
        SizedBox(height: 16,) , 

        Text(widget.detaliesModel.strMeal! ,
       style: TextStyle(fontSize: 18 , 
       fontWeight:FontWeight.bold , 
      color: Colors.orange,), ),
SizedBox(height: 16,) , 
DescriptionTextWidget(text: widget.detaliesModel.strInstructions! , ),
      ],
    ),
), )


]) ,) ; 
  }
}
class carddetalesmeal extends StatelessWidget {
   carddetalesmeal({super.key , required this.detaliesModel});
    DetaliesModel detaliesModel ;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
       decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, style: BorderStyle.solid ),
          boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10))
          ]),
child:  Padding(
  padding: const EdgeInsets.all(18),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(detaliesModel.strMealThumb! , 
        ), 
  Padding(
    padding: const EdgeInsets.only(top: 50),
    child: Column(
      children: [Text(detaliesModel.strMeal! ,
      overflow: TextOverflow.ellipsis
       , style: TextStyle(fontSize: 18 , 
       fontWeight:FontWeight.bold , 
      color: Colors.orange,), ),
    Text(detaliesModel.strCategory!),
    IconButton(onPressed: (){
launcher.launchUrl(Uri.parse(detaliesModel.strYoutube!),
                  mode: launcher.LaunchMode.externalApplication);

        }, icon: FaIcon(FontAwesomeIcons.youtube , color:Colors.red, size: 50,), 
),],
    
    ),
  )
      ],
    ),
) ,



    ) ;
  }
}