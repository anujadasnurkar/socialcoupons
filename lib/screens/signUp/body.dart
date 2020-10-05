import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/components/formError.dart';
import 'package:socialcoupons/components/socialIcon.dart';
import 'package:socialcoupons/screens/donate/DonateHome.dart';
import 'package:socialcoupons/screens/donate/explore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialcoupons/screens/signIn/signIn.dart';
import 'package:socialcoupons/services/usermanagement.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';

class Body extends StatelessWidget {
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
                  "Create your account!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign up with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight*0.04,),
                Text(
                  "Continue with:",
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      icon: "assets/icons/facebook.svg",
                      press: (){},
                    ),
                    SocialIcon(
                      icon: "assets/icons/google.svg",
                      press: (){},
                    ),
                    SocialIcon(
                      icon: "assets/icons/twitter.svg",
                      press: (){},
                    ),
                  ],
                ),
                SizedBox(height:getProportionateScreenHeight(20)),
                Text(
                  "By clicking Continue, you agree to our Terms and Conditions",
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  String newPassword;
  bool remember=false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value){
              if (value.isNotEmpty && errors.contains(kEmailNullError)){
                setState(() {
                  errors.remove(kEmailNullError);
                });
              }
              else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value){
              if (value.isEmpty && !errors.contains(kEmailNullError)){
                setState(() {
                  errors.add(kEmailNullError);
                });
              }
              else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixIcon: CustomSuffixIcon(url: "assets/icons/Mail.svg",),
            ),
            onFieldSubmitted: (value){
              this.email=value;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password=newValue,
            onChanged: (value){
              if (value.isNotEmpty && errors.contains(kPassNullError)){
                setState(() {
                  errors.remove(kPassNullError);
                });
              }
              else if (value.length>=8 && errors.contains(kShortPassError)){
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
              return null;
            },
            validator: (value){
              if (value.isEmpty && !errors.contains(kPassNullError)){
                setState(() {
                  errors.add(kPassNullError);
                });
              }
              else if (value.length<8 && !errors.contains(kShortPassError)){
                setState(() {
                  errors.add(kShortPassError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,

                //ADD SUFFIX ICON!!!!!
                suffixIcon: CustomSuffixIcon(url: "assets/icons/Lock.svg",)
            ),
            onFieldSubmitted: (value){
              this.password=value;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => newPassword=newValue,
            onChanged: (value){
              if (value.isNotEmpty && errors.contains(kPassNullError)){
                setState(() {
                  errors.remove(kPassNullError);
                });
              }
              else if (newPassword==password && errors.contains(kShortPassError)){
                setState(() {
                  errors.remove(kMatchPassError);
                });
              }
              return null;
            },
            validator: (value){
              if (value.isEmpty && !errors.contains(kPassNullError)){
                setState(() {
                  errors.add(kPassNullError);
                });
              }
              else if (newPassword!=password && !errors.contains(kShortPassError)){
                setState(() {
                  errors.add(kMatchPassError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Re-enter your password",
                labelText: "Confirm password",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,

                //ADD SUFFIX ICON!!!!!
                suffixIcon: CustomSuffixIcon(url: "assets/icons/Lock.svg",)
            ),
            onFieldSubmitted: (value){
              this.newPassword=value;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          FormError(errors: errors,),
          SizedBox(height: getProportionateScreenHeight(20),),

          DefaultButton(
            text: "Continue",
            press: () {
                if (_formKey.currentState.validate()){
                _formKey.currentState.save();
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                   email: email, 
                   password: password).then((signedInUser) {
                     if(signedInUser!=null){
                   UserManagement().storeNewUser(signedInUser.user, context);
                     }
                }).catchError((e){
                  print(e);
                });
              }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );

            },
          ),
        ],
      ),
    );
  }
}


