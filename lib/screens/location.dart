import 'package:details/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _LocationState();
}

class _LocationState extends State<location> {
  Widget title({required String text}) => Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Center(
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
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Location'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 50),
        height: 500,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          title(text: 'Here is our location'),
        ]),
      ),
    );
  }
}

//belum siap lagi
