
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_printing/screens/order.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:file_picker/file_picker.dart';
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

       Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ));
        } else {
          return const SizedBox(
            height: 20,
          );
        }
      }));

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  File? file;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    final path = result.files.first;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'printDino/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Donwload link: $urlDownload');

    setState(() {
      uploadTask = null;
    });
  }
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
                                      Row(
                            children: [
                              const Text('Upload File:',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black)),
                              if (pickedFile != null)
                                Expanded(
                                    child: Container(
                                        child: Center(
                                            child: Text(pickedFile!.name)))),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                  onPressed: selectFile,
                                  child: const Text('Select File')),
                              const SizedBox(width: 15),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.indigo, width: 2),
                                  ),
                                  onPressed: uploadFile,
                                  child: const Text('Upload File')),
                              const SizedBox(width: 15),
                              buildProgress(),
                            ],
                          ),
                          const Text("please press 'Upload File' button after select the file",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.red,
                                      fontWeight: FontWeight.w400)),
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
