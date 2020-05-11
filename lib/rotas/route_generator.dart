import 'package:flutter/material.dart';
import 'package:sonoticia/screens/home.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case "Home":
        return MaterialPageRoute(
          builder: (_) => Home()
        );
    }
  }
}