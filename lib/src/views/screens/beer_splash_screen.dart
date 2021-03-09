import 'package:beer_team_stable/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeerSplashScreen extends StatefulWidget {
  @override
  _BeerSplashScreenState createState() => _BeerSplashScreenState();
}

class _BeerSplashScreenState extends State<BeerSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constPrimaryColor,
      body: Image.asset('assets/giphy.gif'),
    );
    // seconds: 100,
    // image: Image.asset('assets/giphy.gif'),
    // loaderColor: Colors.white,
    // title: Text(
    //   'Beer team',
    //   style: TextStyle(
    //       fontSize: constHeaderFontSize, fontWeight: FontWeight.bold),
    // ),
    // photoSize: 150,
    // navigateAfterSeconds: HomeScreen());
  }
}
