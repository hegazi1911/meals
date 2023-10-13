import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meals/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_textfild.dart';

class RigesterPage extends StatelessWidget {
  const RigesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: rigesterView(),
    );
  }
}

class rigesterView extends StatelessWidget {
  const rigesterView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password;
    FirebaseAuth auth = FirebaseAuth.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Meals",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const CussstomTextFild(
              hint: "name",
            ),
            const SizedBox(
              height: 16,
            ),
            CussstomTextFild(
              onchange: (data) {
                email = data;
              },
              hint: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            CussstomTextFild(
              onchange: (data) {
                password = data;
              },
              hint: "password",
            ),
            const SizedBox(
              height: 30,
            ),
            customButton(
              title: 'sing up',
              onTap: () {
                auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);
                context.push('/categories');
              },
            ),
            Row(
              children: [
                Text("already tou have account ?  "),
                GestureDetector(
                    onTap: () {
                      context.go("/singIn");
                    },
                    child: Text('sing in '))
              ],
            )
          ],
        ),
      ),
    );
  }
}
