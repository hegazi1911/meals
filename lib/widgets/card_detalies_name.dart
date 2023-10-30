import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/Model/detalies_model.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class CardDetaliesName extends StatelessWidget {
   CardDetaliesName({super.key , required this.detaliesModel});
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
                offset: const Offset(10, 10))
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
       , style: const TextStyle(fontSize: 18 , 
       fontWeight:FontWeight.bold , 
      color: Colors.orange,), ),
    Text(detaliesModel.strCategory!),
    IconButton(onPressed: (){
launcher.launchUrl(Uri.parse(detaliesModel.strYoutube!),
                  mode: launcher.LaunchMode.externalApplication);

        }, icon: const FaIcon(FontAwesomeIcons.youtube , color:Colors.red, size: 50,), 
),],
    
    ),
  )
      ],
    ),
) ,



    ) ;
  }
}