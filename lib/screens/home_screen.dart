//import 'package:details/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/screens/signin_screen.dart';
import 'package:dino_printing/router/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  Widget _UserDetails({
    required Color color,
    required String image,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu(
          {required String image,
          required String name,
          required VoidCallback onClicked}) =>
      InkWell(
          onTap: onClicked,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Dino Printing',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          centerTitle: true,
        ),
        body: Container(
            height: 700,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 200,
                            child: _UserDetails(
                              color: Theme.of(context).colorScheme.secondary,
                              image: 'assets/dino.png',
                              title: 'Hi There! Welcome',
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                            height: 400,
                            child: InkWell(
                                child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.30,
                              children: [
                                _menu(
                                  onClicked: () => Navigator.pushNamed(
                                      context, Routes.orderForm),
                                  image: 'assets/orderform.png',
                                  name: 'Order Form',
                                ),
                                _menu(
                                  onClicked: () => Navigator.pushNamed(
                                      context, Routes.location),
                                  image: 'assets/map.png',
                                  name: 'Location',
                                ),
                                _menu(
                                  onClicked: () => Navigator.pushNamed(
                                      context, Routes.profile),
                                  image: 'assets/setting.png',
                                  name: 'Profile',
                                ),
                                _menu(
                                  onClicked: () => Navigator.pushNamed(
                                      context, Routes.contactUs),
                                  image: 'assets/contact.png',
                                  name: 'Contact Us',
                                ),
                              ],
                            ))),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
