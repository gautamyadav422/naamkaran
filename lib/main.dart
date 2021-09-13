import 'package:flutter/material.dart';
import 'package:naamkaran/Hindu/boys.dart';

import 'package:naamkaran/MyHomePage.dart';

import 'package:naamkaran/Pages/hindi.dart';

import 'package:naamkaran/splash.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      // home: MyHomePage(),
      routes: {
        "/": (context) => SplashScreen(),
        "/mainPage": (context) => MyHomePage(),
        "/hindu": (context) => BoysPage(),
        "/hinduboys": (context) => BoysPage1(),
      },
    );
  }
}
