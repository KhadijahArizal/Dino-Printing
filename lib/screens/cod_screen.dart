import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/order.dart';

class CodOption extends StatefulWidget {
  const CodOption ({Key? key}) : super(key: key);

  @override
  State<CodOption> createState() => _CodOptionState();
}

class _CodOptionState extends State<CodOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment via Cash On Delivery'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 350,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/card.png',
                    width: 300, height: 300, fit: BoxFit.cover),
              ),
            ),
            const Text('Thank You',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            const Text('Your order is in proccess',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    textBaseline: TextBaseline.alphabetic)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeScreen);
              },
              child: const Text('My Order'),
            ),
          ],
        ),
      ),
    );
  }
}

