import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaixaTexto extends StatefulWidget {
  @override
  _CaixaTextoState createState() => _CaixaTextoState();
}

class _CaixaTextoState extends State<CaixaTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrada dados")), // Título do App
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16), // espaçamento
            child: TextField(
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration(labelText: "Digite o Primeiro Nome: "),
              //enabled: false,   // Bloqueia a digitação no field
              maxLength: 50,
              //obscureText: true,  // esconde o texto inserido
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), // espaçamento
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Digite seu Email: "),
              //enabled: false,   // Bloqueia a digitação no field
              maxLength: 50,
              //obscureText: true,  // esconde o texto inserido
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16), // espaçamento
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Digite seu Telefone: "),
              //enabled: false,   // Bloqueia a digitação no field
              maxLength: 50,
              //obscureText: true,  // esconde o texto inserido
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
          RaisedButton(
              child: Text("Salvar"),
              color: Colors.black26,
              onPressed: () {
                print("test");
              })
        ],
      ),
    );
  }
}
