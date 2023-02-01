
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/screens/home_screen.dart';
import 'package:dino_printing/screens/profile_screen.dart';
import 'package:dino_printing/screens/signup_screen.dart';
import 'package:dino_printing/reusable_widgets/reusable_widgets.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              /*Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),*/
              Color(0xffff9311),
              Color(0xff0f1ef0),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
             tileMode: TileMode.mirror,
          ),
        ),
          child: SingleChildScrollView(child: Padding(padding: EdgeInsets.fromLTRB(
            20,MediaQuery.of(context).size.height * 0.1, 20, 120),
          child: Column(
            children:<Widget> [
              Image.asset("assets/logo.png"),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false, 
              _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
               _passwordTextController),
               const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true,() {
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, 
                password: _passwordTextController.text).then((value) {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
                }).onError((error, stackTrace){
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption()
              ],
              ),
              ),
              ),
              ),
              );
}


   Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
        style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          )
      ],
      );
   }
}
