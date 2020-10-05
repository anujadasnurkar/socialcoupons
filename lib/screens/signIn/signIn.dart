import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/screens/signIn/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName= "/signIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}

