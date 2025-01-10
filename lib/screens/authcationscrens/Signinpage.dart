import 'dart:ui';
import 'package:ecom/screens/authcationscrens/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import '../../services/auth_service.dart';
import '../../utils/Textfield.dart';

class Signscreen extends StatefulWidget {
  const Signscreen({super.key});

  @override
  State<Signscreen> createState() => _SignscreenState();
}

class _SignscreenState extends State<Signscreen> with SingleTickerProviderStateMixin {
  AuthService authService = AuthService();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrompassword = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize animation controller and animation
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void showAnimatedAlert(BuildContext context, String title, String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: _animationController,
            curve: Curves.bounceInOut,
          ),
          child: AlertDialog(
            title: Row(
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.warning,
                  color: isSuccess ? Colors.green : Colors.orange,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSuccess ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSuccess)
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(seconds: 2),
                    child: Icon(Icons.emoji_emotions, color: Colors.green, size: 60),
                  )
                else
                  Icon(Icons.error_outline, color: Colors.orange, size: 60),
                SizedBox(height: 10),
                Text(message),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'), // Background image
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Image(image: AssetImage('images/loginlogo.png')),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Textfield(controller: email, hint: "Email"),
                                Textfield(controller: password, hint: "Password"),
                                Textfield(controller: confrompassword, hint: "Conform password"),
                                GestureDetector(
                                  onTap: () {
                                    if (password.text == confrompassword.text) {
                                      authService.registerWithEmailPassword(email.text, password.text);
                                      showAnimatedAlert(
                                        context,
                                        'Sign In Success',
                                        'Welcome! Your account has been successfully created.',
                                        true,
                                      );
                                      Future.delayed(Duration(seconds: 2), () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => loginscreen()),
                                        );
                                      });
                                    } else {
                                      showAnimatedAlert(
                                        context,
                                        'Password Mismatch',
                                        'Passwords do not match. Please try again.',
                                        false,
                                      );
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.brown),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Center(
                                        child: Text(
                                          "SignIn",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginscreen()));
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "I already have an account?",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        TextSpan(
                                          text: " Login",
                                          style: TextStyle(color: Colors.red, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
