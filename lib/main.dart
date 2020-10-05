import 'package:flutter/material.dart';
import 'package:socialcoupons/screens/onboarding/splashScreen.dart';
import 'package:socialcoupons/theme.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: SplashScreen(),
    );
  }
}

