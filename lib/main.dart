
import 'package:sonoticia/rotas/route_generator.dart';
import 'package:sonoticia/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:sonoticia/screens/initscreen.dart';
import 'package:sonoticia/screens/opennoticia.dart';


void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: RouteGenerator.generateRoute,
    home: InitScreen(),
  ));
}