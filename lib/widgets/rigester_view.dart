import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/widgets/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meals/widgets/snack_bar.dart';

class RigesterView extends StatelessWidget {
  const RigesterView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password;
    FirebaseAuth auth = FirebaseAuth.instance;
    GlobalKey<FormState> formkey = GlobalKey();

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
                        'Rigester',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 100),
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
                            child: Form(
                              key: formkey,
                              child: Column(
                                children: <Widget>[
                                  customtextfild(
                                    title: "Name",
                                    onchange: (data) {},
                                    obscureText: false,
                                  ),
                                  customtextfild(
                                    title: "Email",
                                    onchange: (data) {
                                      email = data;
                                    },
                                    obscureText: false,
                                  ),
                                  customtextfild(
                                    title: "Password",
                                    onchange: (data) {
                                      password = data;
                                    },
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            title: 'Rigester',
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                try {
                                  var auth = FirebaseAuth.instance;

                                  await auth.createUserWithEmailAndPassword(
                                      email: email!, password: password!);
                                  showSnackBar(context, "success");
                                  context.pop('/categories/:id');
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    showSnackBar(context, "week password");
                                  } else if (e.code == 'email-already-in-use') {
                                    showSnackBar(context, "Email already use");
                                  }
                                }
                              } else {
                                showSnackBar(context, "wrong");
                              }
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Text(
                                "already you have account ?  ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    context.go("/singIn");
                                  },
                                  child: const Text(
                                    'Login ',
                                    style: TextStyle(color: Colors.blue),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container customtextfild(
    {required String title,
    required void Function(String?)? onchange,
    required bool obscureText}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)))),
    child: TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "is Empty";
        }
      },
      obscureText: obscureText,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    ),
  );
}
