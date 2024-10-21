// router.dart

import 'package:flutter/material.dart';
import 'package:keldate/screens/Auth/otp_screen.dart';

import 'package:keldate/screens/Auth/signup_screen.dart';
import 'package:keldate/screens/Auth/login_screen.dart';
import 'package:keldate/screens/Home/home_screen.dart';

import 'package:keldate/screens/Auth/splash_screen.dart';

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
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
