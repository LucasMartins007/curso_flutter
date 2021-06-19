import 'package:flutter/material.dart';
import 'package:navegacao_por_rotas/Home.dart';

import 'Conteudo.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (context) => Home());
      case "/1":
        return MaterialPageRoute(builder: (context) => Home());
      case "/2":
        return MaterialPageRoute(builder: (context) => Conteudo());

        default:
          return _error();
    }
  }


  static Route<dynamic> _error(){
    return MaterialPageRoute (builder: (context){
        return Scaffold(
          appBar: AppBar(
            title: Text("Tela não encontrada"),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                    child: Text("Tela não encontrada, Voltar!"),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "/1");
                    }
                )
              ],
            ),
          ),
        );
    });
  }
}