import 'dart:async';
import 'package:driver_app/presentation/resourses/assets_manager.dart';
import 'package:driver_app/screens/home/home_screen.dart';
import 'package:driver_app/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(
            logoPath: ImageAssets.logo,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Stack(children: [
        Container(
          height: queryData.size.height,
          width: queryData.size.width,
          child: Image.asset(
            ImageAssets.splash,
            fit: BoxFit.fill,
          ),
        ),
      ]),
    );
  }
}
