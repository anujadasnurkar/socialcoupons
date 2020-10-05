import 'package:flutter/cupertino.dart';
import 'package:socialcoupons/screens/onboarding/splashScreen.dart';
import 'package:socialcoupons/screens/signIn/signIn.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};