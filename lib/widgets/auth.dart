import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meals/view/categories_page.dart';
import 'package:meals/view/sing_in.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:((context,snapshot) { 
          if (snapshot.hasData) {
            return CategoriesPage() ; 
          }else{ 
            return SingInPage() ; 
          }
        })
        
        
          ),
    );
  }
}