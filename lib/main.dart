import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/cod_screen.dart';
import 'package:dino_printing/screens/contactUs_screen.dart';
import 'package:dino_printing/screens/home_screen.dart';
import 'package:dino_printing/screens/location_screen.dart';
import 'package:dino_printing/screens/orderdetail_screen.dart';
import 'package:dino_printing/screens/orderform_screen.dart';
import 'package:dino_printing/screens/payment_screen.dart';
import 'package:dino_printing/screens/profile_screen.dart';
import 'package:dino_printing/screens/signin_screen.dart';
import 'package:dino_printing/screens/transfer_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 
void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = 'DINO PRINTING';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino Printing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SignInScreen(),
        routes: {
          Routes.orderForm: (context) => const orderForm(),
          Routes.orderDetail: (context) => const OrderDetail(),
          Routes.profile: (context) => const UserProfile(),
          Routes.location: (context) => const Location(),
          Routes.contactUs: (context) => const contactUs(),
          Routes.paymentOption: (context) => const PaymentOption(),
          Routes.codOption: (context) => const CodOption(),
          Routes.transferOption: (context) => const TransferOption(),
          Routes.homeScreen: (context) => const HomeScreen()
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController pageController=PageController();
  List<Widget>pages=[const HomeScreen(),const UserProfile()];

  int selectIndex=0;
  void onPageChanged(int index){
    setState(() {
      selectIndex=index;
    });
  }

  void onItemTap(int selectedItems){
    pageController.jumpToPage(selectedItems);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: selectIndex==0?Colors.indigo:Colors.grey,),
          label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: selectIndex==1?Colors.indigo:Colors.grey,),
          label: 'Setting'),
         ],
      ),
    );
  }
}