import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socialcoupons/components/bottomNavBar.dart';
import 'package:socialcoupons/constants.dart';
import 'package:socialcoupons/screens/donate/DonateHome.dart';
import 'package:socialcoupons/screens/events/model/category.dart';
import 'package:socialcoupons/screens/events/model/event.dart';
import 'package:socialcoupons/screens/events/styleguide.dart';
import 'package:socialcoupons/screens/events/eventDetails/event_details_page.dart';
import 'package:provider/provider.dart';
import 'package:socialcoupons/services/database.dart';

import '../../events/app_state.dart';
import 'category_widget.dart';
//import 'event_widget.dart';
import 'home_page_background.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Stream eventStream;
  EventData eventData = EventData();

  void initState() {
    eventData.getEventData().then((value) {
      eventStream = value;
      setState(() {});
    });
    super.initState();
  }


  Widget eventList() {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            stream: eventStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return EventWidget(
                      title: snapshot.data.docs[index].data()['title'],
                      location: snapshot.data.docs[index].data()["location"],
                      duration: snapshot.data.docs[index].data()["duration"],
                    );
                  });
            },
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events", style: TextStyle(color: Colors.white),),
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DonateHome()),
        );
      },
        backgroundColor: Color(0xFFF17532),
        child: IconButton(
          icon: SvgPicture.asset("assets/icons/coin.svg"),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DonateHome()),
            );
          },
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "Current Events",
                        style: whiteHeadingTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[for (final category in categories) CategoryWidget(category: category)],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: eventList(),
//                                child: eventList(),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

  }
}


class EventWidget extends StatelessWidget {

  final String title;
  final String ngoName;
  final String location;
  final String duration;
  final String date;
  final String description;
  final String eventID;

  const EventWidget({Key key, this.title, this.ngoName, this.location, this.duration, this.date, this.description, this.eventID}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
//              child: Image.asset(
//                imagePath,
//                height: 150,
//                fit: BoxFit.fitWidth,
//              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                location,
                                style: eventLocationTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      duration,
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
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




//child:
//                      child: Consumer<AppState>(
//                        builder: (context, appState, _) =>
//                        Column(
//                          children: <Widget>[
//                            for (final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId)))
//                              GestureDetector(
//                                onTap: () {
//                                  Navigator.of(context).push(
//                                    MaterialPageRoute(
//                                      builder: (context) => EventDetailsPage(event: event),
//                                    ),
//                                  );
//                                },