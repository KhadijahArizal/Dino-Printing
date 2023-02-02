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
   Orders order = ModalRoute.of(context)!.settings.arguments as Orders;

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
              child: Text('Mahallah : ${order.mahallah}'),
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
              margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            title: const Text('Choose your payment',
                                textAlign: TextAlign.center),
                            actions: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(100, 50),
                                            primary: Colors.orange),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Routes.codOption);
                                        },
                                        child: const Text('COD')),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(100, 50),
                                            primary: Colors.green,),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Routes.transferOption);
                                        },
                                        child: const Text('Online Transfer')),
                                        const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                },
                child: const Text('Proceed to Payment'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
