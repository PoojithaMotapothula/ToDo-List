import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => ListScreen(),
        ),
      ),
    );
    startImageAnimation();
  }
  void startImageAnimation() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                duration: Duration(seconds: 2), 
                opacity: opacity,
                child: Container(
                  child: Image.asset('assets/images/splash.png', width: 300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
