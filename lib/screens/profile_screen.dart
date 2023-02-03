import 'package:dino_printing/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/main.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

final user = FirebaseAuth.instance.currentUser!;

class _ProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Center(
          child: Text('User Profile'),
        ),
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFiYml0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
            ),
            Text(
              user.email!,
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            Divider(),
            const Text(
              'USER DINO PRINTING',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 15.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.indigo.shade300,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 45.0,
              ),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 24.0,
                  color: Colors.indigo.shade800,
                ),
                title: Text(
                  user.email!,
                  style: TextStyle(
                    color: Colors.indigo.shade800,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    fixedSize: const Size(140, 65),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
                child: const Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  });
                })
          ],
        ),
      ),
    );
  }
}
