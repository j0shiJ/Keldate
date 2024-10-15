// lib/screens/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after a 3-second delay, removing SplashScreen from the stack
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (Route<dynamic> route) => false, // This removes all previous routes
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen size for responsiveness
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Centered logo
          // Center(
          //   child: Image.asset(
          //     'assets/images/logo.png',
          //     width: screenSize.width * 0.4, // 40% of screen width
          //     height: screenSize.height * 0.4, // 40% of screen height
          //   ),
          // ),
        ],
      ),
    );
  }
}
