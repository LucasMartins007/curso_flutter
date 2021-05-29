import 'package:flutter/material.dart';

class ConteudoProgramatico extends StatefulWidget {
  @override
  _ConteudoProgramaticoState createState() => _ConteudoProgramaticoState();
}

class _ConteudoProgramaticoState extends State<ConteudoProgramatico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Conteúdo Programatico"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("1 - Introdução ao flutter "
                "\n2 - Instalação e configuração"
                "\n3 - Navegação entre telas"),
          ],
        ),
      ),
    );
  }
}
