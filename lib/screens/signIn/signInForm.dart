import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/components/formError.dart';
import 'package:socialcoupons/components/option.dart';
import 'package:socialcoupons/constants.dart';
import 'package:socialcoupons/screens/forgotPassword.dart';
import 'package:socialcoupons/services/usermanagement.dart';

import '../../sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool remember=false;

  SignIn() {
    if (_formKey.currentState.validate()) {

    }

  }

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
          FormError(errors: errors,),
          SizedBox(height: getProportionateScreenHeight(20),),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember=value;
                    });
                  }),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: Text("Forgot Password?", style: TextStyle(
                    decoration: TextDecoration.underline
                ),),
              ),
            ],
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()){
                _formKey.currentState.save();
              }
              FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password).then((value) {
                    if (value==null)
                      Text("Error");
                    else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Option()),
                      );
                    }
//                Navigator.of(context).pushReplacementNamed("homepage");
              }).catchError((e){
                print(e);
              });

            },
          ),
        ],
      ),
    );
  }
}

