import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _exibirTelaCadastro(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Você deseja se cadastrar?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                      Text("Texo hhaaaa")
                ],
              )
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text("sim"),
                  onPressed: () => Navigator.pop(context),
              ),
              RaisedButton(
                child: Text("não"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Pessoa"),
        backgroundColor: Colors.black26,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _exibirTelaCadastro();
        },
      )
    );
  }
}
