import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/order.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail ({Key? key}) : super(key: key);

  @override
  State<OrderDetail > createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail > {
  bool _showNotch = true;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
   Order order = ModalRoute.of(context)!.settings.arguments as Order;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Confirmation'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text('Name  : ${order.name}'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: Text('Phone No  : ${order.phoneNo}'), //error
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: Text('Size  : ${order.size}'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: Text('Quantity  : ${order.quantity}'), //error
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: Text('Color  : ${order.color}'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: Text('Time : ${order.time}'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: Text('Delivery Option  : ${order.deliver}'),
            ),
            
           
            Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Edit'),
                )),
                Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, Routes.thirdScreen);
                },
                child: const Text('Payment'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
