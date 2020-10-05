import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme(){
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10
  );
  return InputDecorationTheme(
//              floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 20
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(
      color: kTextColor,
    ),
    bodyText2: TextStyle(
      color: kTextColor,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(headline6: TextStyle(color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold))
  );


}

