import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  void _NavegationHome(){
    Navigator.pushReplacementNamed(context, "Home");
  }

  _startSplashScreenTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, _NavegationHome);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSplashScreenTime();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
     return Scaffold(
      backgroundColor: Color(0xFF143642),
      body: Center(
        child: Container(
            child: Image.asset("images/logo.png")
        ),
      ),
    );
  }
}
