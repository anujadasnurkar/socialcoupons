import 'package:flutter/material.dart';
import 'package:socialcoupons/constants.dart';

final TextStyle fadedTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLightColor,
);

final TextStyle whiteHeadingTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

final TextStyle categoryTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

final TextStyle selectedCategoryTextStyle = categoryTextStyle.copyWith(
  color: kPrimaryColor,
);

final TextStyle eventTitleTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

final TextStyle eventWhiteTitleTextStyle = TextStyle(
  fontSize: 38.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

final TextStyle eventLocationTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFF000000),
);

final TextStyle guestTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: Color(0xFF000000),
);

final TextStyle punchLine1TextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w800,
  color: Color(0xFFFF4700),
);

final TextStyle punchLine2TextStyle = punchLine1TextStyle.copyWith(color: Color(0xFF000000));
