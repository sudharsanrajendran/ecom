import 'package:ecom/screens/authcationscrens/Loginscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>loginscreen())); // Navigate to the home screen
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/loginlogo.png'), // Splash image
      ),
    );
  }
}
