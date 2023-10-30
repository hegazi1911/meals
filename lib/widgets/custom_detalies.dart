import 'package:flutter/material.dart';
import 'package:meals/Model/detalies_model.dart';

class CustomDetalies extends StatelessWidget {
   CustomDetalies({super.key , required this.detaliesModel});
DetaliesModel detaliesModel ;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                detaliesModel.strCategory!,
                style: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF17532))
              ),
            ),
              SizedBox(height: 15.0),
              Center(
                child: Hero(
                  
                  tag: "iamge",
                  child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(detaliesModel.strMealThumb!,
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.contain
                    
                    ),
                  )
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(detaliesModel.strArea!,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF17532))),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(detaliesModel.strMeal!,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 24.0)),
              ),
              SizedBox(height: 20.0),
              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
                    
                    Column(
                    
                      children: [
                        Text(detaliesModel.strIngredient1! ,style: const TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold),),
                        Text(detaliesModel.strIngredient2! , style: const TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                        Text(detaliesModel.strIngredient3!, style: const TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                        Text(detaliesModel.strIngredient4! ,  style: const TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                         Text(detaliesModel.strIngredient5! , style: const TextStyle(fontSize: 20 , color: Colors.orange , fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(detaliesModel.strMeasure1! ,  style: const TextStyle(fontSize: 20),),
                        Text(detaliesModel.strMeasure2!,  style: const TextStyle(fontSize: 20)),
                        Text(detaliesModel.strMeasure3!, style: const TextStyle(fontSize: 20)),
                        Text(detaliesModel.strMeasure4! ,  style: const TextStyle(fontSize: 20)),
                        Text(detaliesModel.strMeasure5! ,  style: const TextStyle(fontSize: 20)),
              
                      ],
                    )
                  ],
            ),
                        SizedBox(height: 20.0),
    
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  child: Text( detaliesModel.strInstructions!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            
      
             
          ]),
    );
       
    
  }
}
