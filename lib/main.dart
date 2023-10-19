import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Model/meals_model.dart';
import 'package:meals/view/categories_page.dart';
import 'package:meals/view/detalis_meal.dart';
import 'package:meals/view/meals_page.dart';
import 'package:meals/view/rigester_page.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:meals/view/sing_in.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

 void main() async {
 await Hive.initFlutter(  ) ; 
  Hive.registerAdapter(MealModelAdapter());

 await Hive.openBox('favorite');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ProviderScope(child: MealsApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => CategoriesPage(), routes: [
      GoRoute(
        path: 'singIn',
        builder: (context, state) => singInPage(),
      ),
      GoRoute(
        path: 'categories/:id',
        builder: (context, State) => CategoriesPage(),
      ),
      GoRoute(
        path: 'Meals/:id',
        builder: (context, state) => MealsPage(
          id: state.pathParameters["id"],
        ),
      ),
      GoRoute(
        path: 'detalies/:id',
        builder: (context, state) => DetaliesMeal(
          id: state.pathParameters["id"],
        ),
      )
    ]),
  ],
);

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
