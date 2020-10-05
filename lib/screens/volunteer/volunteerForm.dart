import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/bottomNavBar.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/screens/events/eventHome/home_page.dart';
import 'package:socialcoupons/services/database.dart';

import '../../sizeConfig.dart';

class VolunteerForm extends StatelessWidget {
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
  String name;
  String ngo;
  String mobile;
  String email;
  String volunteerID;
  final _formKey = GlobalKey<FormState>();
  DatabaseServiceVolunteer databaseService = DatabaseServiceVolunteer();

  uploadVolunteerData() async{
    if(_formKey.currentState.validate()){
      volunteerID = randomAlphaNumeric(16);
      Map<String, String> volunteerMap = {
        "name": name,
        "ngo": ngo,
        "email": email,
        "mobile": mobile,
      };
      await databaseService.addNgoData(volunteerMap, volunteerID).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }

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
              key: _formKey,
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
                    onChanged: (value){
                      setState(() {
                        name=value;
                      });
                    },
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
                    onChanged: (value){
                      setState(() {
                        ngo=value;
                      });
                    },
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
                    onChanged: (value){
                      setState(() {
                        mobile=value;
                      });
                    },
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
                    onChanged: (value){
                      setState(() {
                        email=value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  DefaultButton(
                    text: "Submit",
                    press: (){
                      uploadVolunteerData();
                    },
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

