import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleSpacing: 20.0,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    ),
    toolbarTextStyle:
    TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.blueGrey,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: defaultColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,

  ),


  fontFamily: 'jannah',
  primarySwatch: defaultColor,

);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFF333739),
  //textTheme: TextTheme(),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.red,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,

  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF333739),
    titleSpacing: 20.0,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    toolbarTextStyle:
    TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xFF333739),
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  fontFamily: 'jannah',
  primarySwatch: defaultColor,

);