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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    
      AppBar(
        title: const Text('Payment via COD (Cash on Delivery'),
      );
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         Container(
          alignment: Alignment.center,
          child: Image.asset('assets/card.png'),
          ),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
          ),
          onPressed: () {
             Navigator.pushNamed(context, Routes.homeScreen);
          },
          child: const Text('Back to Home'),
        ),
        
        ],
      ),
    );
 
  }
}
