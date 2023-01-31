import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/home_screen.dart';
import 'package:dino_printing/screens/profile_screen.dart';
import 'package:dino_printing/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/profile_screen.dart';
import 'package:dino_printing/screens/signin_screen.dart';
 
void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = 'Printing Online Service App';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino Printing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
        routes: {
          //Routes.orderForm: (context) => const orderForm(),
          //Routes.userData: (context) => const userData(),
          Routes.profile: (context) => const UserProfile(),
          //Routes.location: (context) => const location(),
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
  List<Widget>pages=[homePage(),SettingP()];

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
