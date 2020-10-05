import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/option.dart';
import 'package:socialcoupons/components/socialIcon.dart';
import 'package:socialcoupons/constants.dart';
import 'package:socialcoupons/screens/signIn/signInForm.dart';
import 'package:socialcoupons/screens/signUp/signUpScreen.dart';
import 'package:socialcoupons/sizeConfig.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight*0.04,),
                Text(
                  "Welcome back!",
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      icon: "assets/icons/facebook.svg",
                      press: (){},
                    ),
                    SocialIcon(
                      icon: "assets/icons/google.svg",
                      press: (){
//                        googleAuth.signIn().then((result) {
//                          result.authentication.then((googleKey) {
//
//                          }).catchError((e) {
//                            print(e);
//                          });
//                        }).catchError((e) {
//                          print(e);
//                        });
                      },
                    ),
                    SocialIcon(
                      icon: "assets/icons/twitter.svg",
                      press: (){},
                    ),
                  ],
                ),
                SizedBox(height:getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text("Sign up",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kPrimaryLightColor,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


