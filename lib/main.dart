import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/style/themes.dart';

import 'modules/on_boarding/on_boarding_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,

      home: OnBoardingScreen(),
    );
  }
}

