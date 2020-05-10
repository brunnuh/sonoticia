import 'dart:convert';

import 'package:dio/dio.dart';


String _url = "https://newsapi.org/v2/";
String _token = "bfec63dcb57c4e72a9a93d5b7c667d62";
String title;
String description;


final _dio = new Dio();

 Future<List> noticiasPrincipais() async {
   Response<dynamic> response = await _dio.get(_url + "top-headlines?country=br&apiKey=" + _token);
    return (response.data["articles"]);
}



