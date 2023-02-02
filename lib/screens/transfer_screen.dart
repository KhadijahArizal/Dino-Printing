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
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 300,
                alignment: Alignment.center,
                child: Image.asset('assets/qrcode.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black45,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Bank Muamalat',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text('No Account: 1420028616281',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                          textBaseline: TextBaseline.alphabetic)),
                  Text('Remarks: DinoPrinting_(your name)',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textBaseline: TextBaseline.alphabetic)),
                ],
              ),
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
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
