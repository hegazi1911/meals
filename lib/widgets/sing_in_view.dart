import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/view/rigester_page.dart';
import 'package:meals/widgets/custom_button.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password;
    FirebaseAuth auth = FirebaseAuth.instance;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Color.fromARGB(255, 230, 81, 0),
        Color.fromRGBO(239, 108, 0, 1),
        Color.fromRGBO(255, 167, 38, 1),
      ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        customtextfild(
                          title: "Email",
                          onchange: (data) {
                            email = data;
                          },
                        ),
                        customtextfild(
                          title: "Password",
                          onchange: (data) {
                            password = data;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    title: 'Login',
                    onTap: () {
                      try {
                        auth.signInWithEmailAndPassword(
                            email: email!, password: password!);
                      } on Exception catch (e) {
                        Fluttertoast.showToast(
                            msg: "error",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      context.push('/categories');
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Text(
                        "you don'n have account ?  ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RigesterPage()),
                            );
                          },
                          child: const Text(
                            'rigester ',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Container customtextfild(
      {required String title, required void Function(String?)? onchange}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)))),
      child: TextField(
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
