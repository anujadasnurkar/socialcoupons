import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/screens/addEvent/addEvent.dart';
import 'package:socialcoupons/services/database.dart';

import '../../sizeConfig.dart';

class NgoReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Register"),
      ),
      body: RegBodyForm(),
    );
  }
}

class RegBodyForm extends StatefulWidget {

  @override
  _RegBodyFormState createState() => _RegBodyFormState();
}

class _RegBodyFormState extends State<RegBodyForm> {
  String regDeed;
  String name;
  String founderName;
  String panNo;
  String mobileNo;
  String location;
  String estDate;
  String ngoID;
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = DatabaseService();
  void initState(){

    super.initState();
  }

  uploadData() async{
    if(_formKey.currentState.validate()){
      ngoID = randomAlphaNumeric(16);
      Map<String, String> ngoMap = {
        "estDate": estDate,
        "founderName": founderName,
        "location": location,
        "mobile": mobileNo,
        "name": name,
        "ngoID":ngoID,
        "panNo": panNo,
        "regDeed":regDeed,
      };
      await databaseService.addNgoData(ngoMap, ngoID).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => addEvent()),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Register your NGO",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.04,),

              TextFormField(
          decoration: InputDecoration(
          hintText: "Enter your registration deed no.",
            labelText: "Registration deed number",

//              floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.confirmation_number),
            ),
              ),
                onChanged: (value){
                    setState(() {
                      regDeed=value;
                    });
                },
              ),

              SizedBox(height: SizeConfig.screenHeight*0.04,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter name of NGO",
                  labelText: "Name of NGO",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.title),
                  ),
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
                  hintText: "Enter founder's name",
                  labelText: "Founder name",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.person),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    founderName=value;
                  });
                },
              ),

              SizedBox(height: SizeConfig.screenHeight*0.04,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter pan Number",
                  labelText: "Pan number",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.confirmation_number),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    panNo=value;
                  });
                },
              ),

              SizedBox(height: SizeConfig.screenHeight*0.04,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  labelText: "Phone number",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.phone_android),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    mobileNo=value;
                  });
                },
              ),

              SizedBox(height: SizeConfig.screenHeight*0.04,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter location",
                  labelText: "Location",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.location_on),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    location=value;
                  });
                },
              ),

              SizedBox(height: SizeConfig.screenHeight*0.04,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter establishment date",
                  labelText: "Establishment date",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.calendar_today),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    estDate=value;
                  });
                },
              ),

              SizedBox(height: SizeConfig.screenHeight*0.04,),

              DefaultButton(
                text: "Add NGO",
                press: (){
//                  FirebaseFirestore.instance.collection("events").add(
//                      {
//                        "name" : this.name,
//                        "age" : 50,
//                        "email" : "example@example.com",
//                        "address" : {
//                          "street" : "street 24",
//                          "city" : "new york"
//                        }
//                      }).then((value){
//                    print(value.id);
//                  });
                  uploadData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
