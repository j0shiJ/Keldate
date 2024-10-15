// lib/main.dart

import 'package:flutter/material.dart';
import 'package:keldate/router.dart';
import 'package:keldate/theme/provider/theme_provider.dart';
import 'package:keldate/theme/theme_helper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // Add other providers here
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: SplashScreen.routeName, // Set initial route
            onGenerateRoute: AppRouter.generateRoute, // Use the custom router
          );
        },
      ),
    ),
  );
}
