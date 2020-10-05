import 'package:flutter/material.dart';
import 'package:socialcoupons/screens/events/styleguide.dart';

import '../../events/model/event.dart';

//class EventWidget extends StatelessWidget {
////  final Event event;
////
////  const EventWidget({Key key, this.event}) : super(key: key);
//
//
//
//  final String title;
//
//  final String ngoName;
//
//  final String location;
//
//  final String duration;
//
//  final String date;
//
//  final String description;
//
//  final String eventID;
//  final String imagePath;
//
//  const EventWidget({Key key, this.title, this.ngoName, this.location, this.duration, this.date, this.description, this.eventID, this.imagePath}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      margin: const EdgeInsets.symmetric(vertical: 20),
//      elevation: 4,
//      color: Colors.white,
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
//      child: Padding(
//        padding: const EdgeInsets.all(20),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            ClipRRect(
//              borderRadius: BorderRadius.all(
//                Radius.circular(30),
//              ),
//              child: Image.asset(
//                imagePath,
//                height: 150,
//                fit: BoxFit.fitWidth,
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    flex: 3,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          title,
//                          style: eventTitleTextStyle,
//                        ),
//                        SizedBox(
//                          height: 10,
//                        ),
//                        FittedBox(
//                          child: Row(
//                            children: <Widget>[
//                              Icon(Icons.location_on),
//                              SizedBox(
//                                width: 5,
//                              ),
//                              Text(
//                                location,
//                                style: eventLocationTextStyle,
//                              ),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Text(
//                      duration.toUpperCase(),
//                      textAlign: TextAlign.right,
//                      style: eventLocationTextStyle.copyWith(
//                        fontWeight: FontWeight.w900,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//
//
//
