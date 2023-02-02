import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_printing/screens/order.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
// import 'package:dino_printing/screens/orderdetail_screen.dart';
// import 'package:dino_printing/screens/order.dart';

enum size { A1, A2, A3, A4, A5, A6 }

class orderForm extends StatefulWidget {
  const orderForm({Key? key}) : super(key: key);

  @override
  State<orderForm> createState() => _orderFormState();
}

class _orderFormState extends State<orderForm> {
  final _formKey = GlobalKey<FormState>();
  int currentPageIndex = 0;
  size? _paperSize = size.A1;

  // dynamic _name = '';
  // dynamic _phoneNo = '';
  // dynamic _quantity = '';
  dynamic _color = 'Color';
  dynamic _time = 'Time';
  // dynamic _address = '';

  // void _setName(String name) {
  //   setState(() {
  //     _name = name;
  //   });
  // }

  // void _SetPhoneNo(String phoneNo) {
  //   setState(() {
  //     _phoneNo = phoneNo;
  //   });
  // }

  // void _setAddress(String address) {
  //   setState(() {
  //     _address = address;
  //   });
  // }

  // void _setQuantity(String quantity) {
  //   setState(() {
  //     _quantity = quantity;
  //   });
  // }

  void _setColor(String color) {
    setState(() {
      _color = color;
    });
  }

  void _setTime(String time) {
    setState(() {
      _time = time;
    });
  }

  CollectionReference orderform =
      FirebaseFirestore.instance.collection('orderform');
  late String name;
  late String phone;
  late String mahallah;
  // late size paper;
  late String quantity;
  // late String color;
  // late String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Form'),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      height: 750,
                      child: GridView.count(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 15,
                        childAspectRatio: 9,
                        children: [
                          TextFormField(
                            onChanged: ((value) {
                              name = value;
                            }),
                            decoration: const InputDecoration(hintText: 'Name'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            onChanged: ((value) {
                              phone = value;
                            }),
                            decoration:
                                const InputDecoration(hintText: 'Phone No'),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            onChanged: ((value) {
                              mahallah = value;
                            }),
                            decoration:
                                const InputDecoration(hintText: 'Mahallah'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mahallah';
                              }
                              return null;
                            },
                          ),
                          const Text('Size'),
                          ListTile(
                            title: const Text('A1 (594mm X 841mm)'),
                            leading: Radio<size>(
                              value: size.A1,
                              groupValue: _paperSize,
                              onChanged: (size? value) {
                                setState(() {
                                  _paperSize = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('A2 (420mm X 594mm)'),
                            leading: Radio<size>(
                              value: size.A2,
                              groupValue: _paperSize,
                              onChanged: (size? value) {
                                setState(() {
                                  _paperSize = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('A3 (297mm X 420mm)'),
                            leading: Radio<size>(
                              value: size.A3,
                              groupValue: _paperSize,
                              onChanged: (size? value) {
                                setState(() {
                                  _paperSize = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('A4 (210mm X 297mm)'),
                            leading: Radio<size>(
                              value: size.A4,
                              groupValue: _paperSize,
                              onChanged: (size? value) {
                                setState(() {
                                  _paperSize = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('A5 (148mm X 297mm)'),
                            leading: Radio<size>(
                              value: size.A5,
                              groupValue: _paperSize,
                              onChanged: (size? value) {
                                setState(() {
                                  _paperSize = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('A6 (105mm X 148mm)'),
                            leading: Radio<size>(
                              value: size.A6,
                              groupValue: _paperSize,
                              onChanged: (size? value) {
                                setState(() {
                                  _paperSize = value;
                                });
                              },
                            ),
                          ),
                          TextFormField(
                            onChanged: ((value) {
                              quantity = value;
                            }),
                            decoration: const InputDecoration(
                                hintText: 'Number of Copies'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the quantity';
                              }
                              return null;
                            },
                          ),
                          DropdownButton<String>(
                            onChanged: ((String? newValue) {
                              setState(() {
                                _color = newValue.toString();
                              });
                            }),
                            isExpanded: true,
                            value: _color, //selected
                            icon: const Icon(Icons.invert_colors),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 1.5,
                              color: Colors.indigo,
                            ),
                            items: <String>['Color', 'Black/White', 'Colorful']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                          ),
                          DropdownButton<String>(
                            onChanged: ((String? newValue) {
                              setState(() {
                              _time = newValue.toString();
                              });
                            }),
                            isExpanded: true,
                            value: _time, //selected
                            icon: const Icon(Icons.schedule),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 1.5,
                              color: Colors.indigo,
                            ),
                            items: <String>[
                              'Time',
                              '9:00 a.m',
                              '10:00 a.m',
                              '11:00 a.m',
                              '2:00 p.m',
                              '3:00 p.m',
                              '4:00 p.m'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              child: const Text('Order'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await orderform.add({
                                    'Name': name,
                                    'Phone No': phone,
                                    'Mahallah': mahallah,
                                    //'Size' : _paperSize,
                                    'Quantity': quantity,
                                    // 'Color' : _color,
                                    // 'Time' : _time
                                  }).then((value) => Navigator.pushNamed(
                                      context, Routes.orderDetail,
                                      arguments: Orders(
                                          name: name,
                                          phoneNo: phone,
                                          mahallah: mahallah,
                                          size: _paperSize,
                                          quantity: quantity,
                                          color: _color,
                                          time: _time)));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
