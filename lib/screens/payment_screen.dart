import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/order.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption ({Key? key}) : super(key: key);

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
 
 @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
          ),
          onPressed: () {
             Navigator.pushNamed(context, Routes.codOption);
          },
          child: const Text('COD (Cash on Delivery'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
          ),
          onPressed: () {
             Navigator.pushNamed(context, Routes.transferOption);
          },
          child: const Text('Online Transfer'),
        ),
        ],
      ),
    );

   
      
  }
}
