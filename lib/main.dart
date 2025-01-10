import 'package:ecom/screens/Home.dart';
import 'package:ecom/screens/authcationscrens/Loginscreen.dart';
import 'package:ecom/screens/Splashscreen.dart';
import 'package:ecom/screens/categoryscreen.dart';
import 'package:ecom/screens/historyscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Firebase for Web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCZTkuj0TODYXB_ykbSsr_gBP3X8_cctaA",
          authDomain: "ecocom-73c8b.firebaseapp.com",
          projectId: "ecocom-73c8b",
          storageBucket: "ecocom-73c8b.firebasestorage.app",
          messagingSenderId: "617783458828",
          appId: "1:617783458828:web:8f78e46211c79f28fd4229",
          measurementId: "G-078BPN122X"
      ),
    );
  } else {
    // Firebase for Android/iOS
    await Firebase.initializeApp();
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Ensure Loginscreen() is defined correctly
    ),
  );
}


class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}
class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    const homescreen(),
      orderscreen(),
      CategoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.brown,
      ),
    );
  }}
