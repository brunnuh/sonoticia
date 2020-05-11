import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenNoticia extends StatefulWidget {
  String titulo;
  String noticia;
  String urlImage;
  String dataPublicada;
  String autor;
  String link;

  OpenNoticia({this.titulo, this.urlImage, this.autor, this.dataPublicada, this.noticia, this.link});


  @override
  _OpenNoticiaState createState() => _OpenNoticiaState();
}

class _OpenNoticiaState extends State<OpenNoticia> {
  double textlen;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     textlen = (widget.titulo.length).toDouble() / 8;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticia"),
        centerTitle: true,
        backgroundColor: Color(0xFFa8201a),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 330,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                              image: NetworkImage(widget.urlImage)
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Center(
                          heightFactor: textlen > 10 ? 5 : textlen,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 4),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  widget.dataPublicada,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.titulo,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 350, left: 8, right: 10),
                      child: Text(
                        widget.noticia != null ? (widget.noticia.length > 260 ? widget.noticia.substring(0, 260) : widget.noticia) : "Sem Noticia",
                        style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.italic
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 4),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Fonte: ${widget.autor == null ? "desconhecido" : widget.autor}\n\n\nApp Ainda em desenvolvimento ... \nQuer continuar lendo ?",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10, left: 4, bottom: 10),
                child: InkWell(
                  child: Text("${widget.link}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),  textAlign: TextAlign.center,),
                  onTap: () async {
                    if(await canLaunch(widget.link)){
                      await launch(widget.link);
                    }
                  },
                ),
              )
            ],
          )
      ),
    );
  }
}
