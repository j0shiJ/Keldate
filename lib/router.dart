// router.dart

import 'package:flutter/material.dart';
import 'package:keldate/screens/Signup_Screen.dart';
import 'package:keldate/screens/login_screen.dart';
import 'package:keldate/screens/otp_Screen.dart';

import 'package:keldate/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case OtpScreen.routeName:
        return MaterialPageRoute(builder: (_) => OtpScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
