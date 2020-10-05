import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:socialcoupons/components/CustomSuffixIcon.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/screens/events/eventHome/home_page.dart';
import 'package:socialcoupons/services/database.dart';

import '../../sizeConfig.dart';

// ignore: camel_case_types
class addEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: addEventBody(),
    );
  }
}

class addEventBody extends StatefulWidget {

  @override
  _addEventBodyState createState() => _addEventBodyState();
}

class _addEventBodyState extends State<addEventBody> {
  String title;
  String ngoName;
  String location;
  String duration;
  String date;
  String description;
  String eventID;
  final _formKey = GlobalKey<FormState>();
  DatabaseServiceEvent databaseService = DatabaseServiceEvent();

  uploadEventData() async{
    if(_formKey.currentState.validate()){
      eventID = randomAlphaNumeric(16);
      Map<String, String> eventMap = {
        "title": title,
        "ngoName": ngoName,
        "location": location,
        "duration": duration,
        "date": date,
        "description":description,
      };
      await databaseService.addNgoData(eventMap, eventID).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Add an event",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Add an event and raise money",
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight*0.06,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter title of event",
                          labelText: "Title",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(Icons.title),
                          ),
                        ),
                        onChanged: (value){
                          setState(() {
                            title=value;
                          });
                        },
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.04,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter the name of your NGO",
                          labelText: "NGO name",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(Icons.label),
                          ),
                        ),
                        onChanged: (value){
                          setState(() {
                            ngoName=value;
                          });
                        },
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.04,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter location of event",
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
                          hintText: "Enter duration of your event",
                          labelText: "Duration",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(Icons.timelapse),
                          ),
                        ),
                        onChanged: (value){
                          setState(() {
                            duration=value;
                          });
                        },
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.04,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter date of your event",
                          labelText: "Date",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        onChanged: (value){
                          setState(() {
                            date=value;
                          });
                        },
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.04,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter description of your event",
                          labelText: "Description",
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(Icons.timelapse),
                          ),
                        ),
                        onChanged: (value){
                          setState(() {
                            description=value;
                          });
                        },
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.04,),
                      DefaultButton(
                        text: "Add event",
                        press: () {
                          uploadEventData();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
