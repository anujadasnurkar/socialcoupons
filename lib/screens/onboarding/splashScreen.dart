import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/screens/onboarding/body.dart';
import '../../sizeConfig.dart';

class SplashScreen extends StatelessWidget {
  static String routeName ="/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
