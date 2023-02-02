
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_printing/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/reusable_widgets/reusable_widgets.dart';
import 'package:dino_printing/screens/home_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {
final TextEditingController _passwordTextController = TextEditingController();
final TextEditingController _emailTextController = TextEditingController();
//TextEditingController _userNameTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up", 
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
        body: Container(
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
             // Color(0xff1f005c),
             // Color(0xff5b0060),
             // Color(0xff870160),
             // Color(0xffac255e),
              //Color(0xffca485c),
              //Color(0xffe16b5c),
              Color(0xffff9311),
              Color(0xff0f1ef0),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            //tileMode: TileMode.mirror,
          ),
        ),
        child: SingleChildScrollView(child: Padding(padding: EdgeInsets.fromLTRB(
            20,MediaQuery.of(context).size.height * 0.1, 20, 138),
          child: Column(
            children: <Widget>[
              Image.asset("assets/logo.png"),
              const SizedBox(
                height: 30,
              ),
             /*reusableTextField("Enter Username", Icons.person_outline, false, 
              _userNameTextController),
              const SizedBox(
                height: 20,
              ),*/
              reusableTextField("Enter Email", Icons.person_outline, false,
               _emailTextController),
               const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
               _passwordTextController),
               const SizedBox(
                height: 20,
              ),
            
             signInSignUpButton(context, false, () {
                FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                email: _emailTextController.text, 
                password: _passwordTextController.text)
                .then((value) {
                  //print("Created New Account");
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()));
                }).onError((error, stackTrace) {
                   print("Error ${error.toString()}");
                });
             })
           ],
          
          ),
        ))),
    );
  }
}