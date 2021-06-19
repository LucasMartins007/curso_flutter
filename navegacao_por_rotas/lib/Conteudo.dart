import 'package:flutter/material.dart';

class Conteudo extends StatefulWidget {

  @override
  _ConteudoState createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conteudo Programatico"),
        backgroundColor: Colors.black26,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("Aula de flutter"),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "/1");
                }
            )
          ],
        ),
      ),
    );
  }
}
