import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/view/sing_in.dart';
import 'package:meals/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser = FirebaseAuth.instance.currentUser! ; 
  final FirebaseAuth auth = FirebaseAuth.instance ; 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200,) , 
            const Icon(Icons.person , size: 70,color: Colors.orange,),
            Text("Email : ${currentUser.email!} " , style: TextStyle(fontSize: 18),),
            const SizedBox(height: 50,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:50 ),
              child: CustomButton(title:'Logout',onTap: (){ 
                auth.signOut() ; 
                
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SingInPage()),
              );                  
            
            
            
              }, ),
            )
          ],
        ),
      ),
    );
  }
}
