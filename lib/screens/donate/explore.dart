import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/constants.dart';
import 'package:socialcoupons/screens/donate/donatePage.dart';
import 'package:socialcoupons/services/database.dart';
import 'package:socialcoupons/sizeConfig.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  Stream ngoStream;
  NgoData ngoData = NgoData();


  Widget ngoList() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            StreamBuilder(
              stream: ngoStream,
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return ngoWidget(
//                      imageUrl:
//                      snapshot.data.documents[index].data['ImgUrl'],
                        name: snapshot.data.docs[index].data()['name'],
                        location: snapshot.data.docs[index].data()["location"],
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }

  void initState() {
    ngoData.getNgoData().then((value) {
      ngoStream = value;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Donate now",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 35,),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categories",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 32,
//
                        fontWeight: FontWeight.w100
//
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w100
                    ),
                  ),
                ],
              ),
              Container(
                height: 300,
                width: 450,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Image.asset("assets/images/slide1.png"),
                    Image.asset("assets/images/slide2.png"),
                    Image.asset("assets/images/slide3.png")
                  ],
                ),
              ),
//            Column(
//              children: [
//                Row(
//                  children: [
//                    Column(
//                      children: [
//                        Row(children: [Text("Feeding America Society",)],),
//                        Row(children: [Text("Oregon",)],),
//                      ],
//                    ),
//
//                  ],
//                ),
//                Row(),
//                Row(),
//              ],
//            ),
              SingleChildScrollView(
                child: Container(
//                margin: EdgeInsets.only(top: 370),
                  height: 400,
                  width: 400,
                  child:
                      ngoList(),

                  ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}

class ngoWidget extends StatelessWidget {
  const ngoWidget({
    Key key, this.regDeed, this.name, this.founderName, this.panNo, this.mobileNo, this.location, this.estDate, this.ngoID,
  }) : super(key: key);
  final String regDeed;
  final String name;
  final String founderName;
  final String panNo;
  final String mobileNo;
  final String location;
  final String estDate;
  final String ngoID;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.more_vert),
//      leading: GestureDetector(
//        onTap: (){
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => DonatePage()),
//          );
//        },
//          child: Image.asset("assets/images/slide1.png")
//      ),
      title: Text(name,
          style: TextStyle(
              fontFamily: "CentraleSansRegular",
              fontSize: 18,
              fontWeight: FontWeight.bold
          )),
      subtitle: Text(location,
          style: TextStyle(
            fontFamily: "CentraleSansRegular",
            fontSize: 15,
          )),
    );
  }
}



//                    ListTile(
//                      trailing: Icon(Icons.more_vert),
//                      leading: Image.asset("assets/images/slide2.png"),
//                      title: Text("Paryavaran Movement",
//                          style: TextStyle(
//                              fontFamily: "CentraleSansRegular",
//                              fontSize: 18,
//                              fontWeight: FontWeight.bold
//                          )),
//                      subtitle: Text("Chennai",
//                          style: TextStyle(
//                            fontFamily: "CentraleSansRegular",
//                            fontSize: 15,
//                          )
//                      ),
//                    ),
