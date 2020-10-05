import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/screens/donate/DonateHome.dart';
import 'package:socialcoupons/screens/ngoReg/ngoReg.dart';

import '../sizeConfig.dart';

class Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: OptionBody(),
      ),
    );
  }
}


class OptionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(
                "Are you a donor?",
              style: TextStyle(
          color: Colors.black,
          fontSize: getProportionateScreenWidth(28),
          fontWeight: FontWeight.bold,
        ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                  "assets/images/donor1.jpg",
              width: 200,
              height: 200,),
            ),

            DefaultButton(
              text: "Continue",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>DonateHome()),
                );
              },
            ),
          SizedBox(height: getProportionateScreenHeight(68),),
            Text(
              "Are you a NGO?",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),

            Image.asset("assets/images/ngo.png",
              width: 200,
              height: 200,),

            DefaultButton(
              text: "Continue",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>NgoReg()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

