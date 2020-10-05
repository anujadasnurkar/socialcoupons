import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socialcoupons/screens/events/eventHome/home_page.dart';
import 'package:socialcoupons/screens/profile/profile.dart';
import 'package:socialcoupons/screens/shop/screens/home_screen.dart';
import 'package:socialcoupons/screens/volunteer/volunteerForm.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      height: 80,
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: ()
      { Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      );
      },
            child: BottomNav(
              title: "Events",
              svgSrc: "assets/icons/calendar.svg",
              isActive: true,
            ),
          ),
          GestureDetector(
            onTap: ()
            { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VolunteerForm()),
            );
            },
            child: BottomNav(
              title: "Volunteer",
              svgSrc: "assets/icons/help.svg",

            ),
          ),
          GestureDetector(
            onTap: ()
            { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            },
            child: BottomNav(
              title: "Shop",
              svgSrc: "assets/icons/shopping-cart.svg",

            ),
          ),GestureDetector(
            onTap: ()
            { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            },
            child: BottomNav(
              title: "Profile",
              svgSrc: "assets/icons/user.svg",
            ),
          ),


        ],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  final bool isActive;
  final bool isSelected;
  final String page;
  const BottomNav({
    Key key, this.title, this.press, this.isActive=false, this.isSelected, this.svgSrc, this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       Container(
         height: 30,
         width: 30,
         child: SvgPicture.asset(
            svgSrc,
            color: isActive ? Colors.white : kPrimaryLightColor,
          ),
       ),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : kPrimaryLightColor,
          ),
        ),
      ],
    );
  }
}








