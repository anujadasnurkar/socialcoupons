import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/screens/signUp/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
