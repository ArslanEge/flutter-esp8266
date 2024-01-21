import 'dart:async';
import 'package:tozero/home.dart';
import 'package:flutter/material.dart';
  // Import your main page widget

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(), // Navigate to MainPage
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Image.asset("assets/images/tozero.png"), // Display your image
      // ),
    );
  }
}
