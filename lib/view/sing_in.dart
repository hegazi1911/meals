import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/widgets/sing_in_view.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfild.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingInView(),
    );
  }
}
