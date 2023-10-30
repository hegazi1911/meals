import 'package:flutter/material.dart';
import 'package:meals/Services/get_detalies.dart';
import 'package:meals/widgets/custom_detalies.dart';
import 'package:meals/widgets/detalies_view.dart';

import '../Model/detalies_model.dart';

class DetaliesMeal extends StatelessWidget {
  DetaliesMeal({
    super.key,
    this.id,
  });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetaliesView(),
    );
  }
}
