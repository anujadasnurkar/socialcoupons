import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialcoupons/components/bottomNavBar.dart';
import 'package:socialcoupons/screens/donate/explore.dart';

class DonateHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Explore"),
      ),
      body: Explore(),
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
