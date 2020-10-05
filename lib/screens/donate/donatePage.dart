import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/bottomNavBar.dart';
import 'package:socialcoupons/components/defaultButton.dart';

import '../../sizeConfig.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Volunteer"),),
      backgroundColor: Colors.white,
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight*0.04,),
          Text(
          "Sign up as a volunteer",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
          ),
        ),
            Form(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      labelText: "Name",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(Icons.person),
                      )
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Select NGO to volunteer for",
                      labelText: "Select NGO",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(Icons.people),
                        )
                    ),

                  ),

                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your mobile number",
                      labelText: "Mobile number",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(Icons.phone_android),
                        )
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email ID",
                      labelText: "Email ID",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(Icons.email),
                        )
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  DefaultButton(
                    text: "Submit",
                    press: (){},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

