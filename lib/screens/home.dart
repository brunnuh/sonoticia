import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:dio/dio.dart';
import 'package:sonoticia/api/noticiasApi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _topHeadlines;

  carregaNoticias() async {
    await noticiasPrincipais().then((data){
     setState(() {
       _topHeadlines = data;
     });
    });

  }

  @override
  void initState(){
    super.initState();
    carregaNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa8201a),
        leading: IconButton(
          icon: Icon(
            Icons.clear_all,
            color: Colors.white,
          ),
          onPressed: (){

          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body:  GridView.count(
          crossAxisCount: 2,
          children: List.generate(_topHeadlines.length, (index){
            return Container(
              child: _blocosDeNoticias(_topHeadlines[index]["urlToImage"], _topHeadlines[index]["title"]),
            );
          }),
      )
      );
  }

  Widget _blocosDeNoticias(String urlImage, String titulo){
    //print("aki >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
   return Container(
    padding: EdgeInsets.all(2),
    child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                image: NetworkImage(urlImage)
              )
            ),
          ),
        Container(
            width: MediaQuery.of(context).size.width / 2,
           child: Text( (titulo.length > 70 ? titulo.substring(0, 70) + "[...]" : titulo ) , style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
        ),
      ],
    ),
   );
  }
}
