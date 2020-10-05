import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/components/formError.dart';
import 'package:socialcoupons/constants.dart';
import 'package:socialcoupons/screens/signUp/signUpScreen.dart';
import '../sizeConfig.dart';

class ForgotPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Forgot Password"),
      ),
      body: (
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.screenHeight * 0.04,),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Please enter your email address to get the password reset link",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.08,),
                      ForgotPass(),
                      SizedBox(height: SizeConfig.screenHeight * 0.08,),
                      SizedBox(height: getProportionateScreenHeight(20)),

                      SizedBox(height: SizeConfig.screenHeight * 0.08,),
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
          )
      ),
    );
  }
}

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
          ),
          SizedBox(height: 40,),
          FormError(errors: errors),
          SizedBox(height: 40,),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          ),
        ],
      ),
    );

  }
}
