import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/order.dart';

class TransferOption extends StatefulWidget {
  const TransferOption ({Key? key}) : super(key: key);

  @override
  State<TransferOption> createState() => _TransferOptionState();
}

class _TransferOptionState extends State<TransferOption> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment via Online Transfer'),
      ),
       body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         Container(
          alignment: Alignment.center,
          child: Image.asset('assets/qrcode.png'),
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
    ),
    );
  }
}