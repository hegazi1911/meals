import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meals/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/widgets/rigester_view.dart';

import '../widgets/custom_textfild.dart';

class RigesterPage extends StatelessWidget {
  const RigesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RigesterView(),
    );
  }
}
