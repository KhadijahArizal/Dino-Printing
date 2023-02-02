import 'package:dino_printing/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dino_printing/router/routes.dart';

import 'contactUs_screen.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Widget title({required String text}) => Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ));

 Widget storeLocation(
          {required IconData icon, Color? color, required String title}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: FaIcon(icon, color: color, size: 15),
              )),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      );

  Future share(SocialMedia socialPlatform) async {
    final urls = {
      SocialMedia.maps: 'https://goo.gl/maps/FMvcrj8od7QqpdJF9',
    };

    final url = urls[socialPlatform]!;

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Location'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 700,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 25),
              const Text('Dino Printing',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      /*letterSpacing: 1,*/
                      fontWeight: FontWeight.w600)),
              const Text('Printing Shop',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 55),
              storeLocation(
                  icon: FontAwesomeIcons.mapLocation,
                  color: Colors.black,
                  title:
                      'Universiti Islam Antarabangsa Malaysia'),
              storeLocation(
                  icon: FontAwesomeIcons.mapLocation,
                  color: Colors.black,
                  title:
                      'Gombak, 53100, Selangor'),
              storeLocation(
                  icon: FontAwesomeIcons.mapPin,
                  color: Colors.white,
                  title:
                      '7P2M+CH Ampang Jaya, Selangor'),
              const SizedBox(height: 25),
              Material(
                color: Colors.indigo,
                elevation: 8,
                borderRadius: BorderRadius.circular(25),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () => share(SocialMedia.maps),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: const AssetImage('assets/dinoMap.jpeg'),
                        height: 120,
                        width: 550,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 6),
                      const Text('Location',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 3)
                    ],
                  ),
                ),
              ),
             
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.homeScreen);
                },
                child: const Text('Back to Home'),
         )
          ]),
          ],
          
        ),
      ),
    );
  }
  }
