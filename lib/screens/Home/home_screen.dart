import 'package:flutter/material.dart';
import 'package:keldate/widgets/CustomBottomNavBar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar();
  }
}
