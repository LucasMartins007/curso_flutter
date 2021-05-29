import 'package:flutter/material.dart';
import 'package:navegacao_entre_telas/ConteudoProgramatico.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Conteúdo Programático"), 
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConteudoProgramatico()));
                }
            )
          ],
        ),
      ),
    );
  }
}
