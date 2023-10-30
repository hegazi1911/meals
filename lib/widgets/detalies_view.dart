import 'package:flutter/material.dart';
import 'package:meals/Model/detalies_model.dart';
import 'package:meals/Services/get_detalies.dart';
import 'package:meals/widgets/custom_detalies.dart';

class DetaliesView extends StatelessWidget {
  DetaliesView({super.key, this.id});
  final String? id;
  DetaliesModel? detaliesModel;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final MealId = routeArgs['id'];
    return FutureBuilder<DetaliesModel>(
        future: GetDetalies().getAllDetalies(id: MealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Display a loading indicator while the future is loading.
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Display an error message if the future encountered an error.
          } else if (snapshot.hasData) {
            // Use the data from the future to build your widget.
            final data = snapshot.data;
            DetaliesModel detalie = snapshot.data! ;
            return SingleChildScrollView(
            
                child: CustomDetalies(detaliesModel: detalie , ),
              
            ) ;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
