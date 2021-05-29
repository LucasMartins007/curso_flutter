import 'package:flutter/material.dart';

class EntradaSwitchState extends StatefulWidget {
  @override
  _EntradaSwitchStateState createState() => _EntradaSwitchStateState();
}

class _EntradaSwitchStateState extends State<EntradaSwitchState> {
  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrada de Dados"),),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
                value: _escolhaUsuario,
                onChanged: (bool valor){
                  setState(() {
                    _escolhaUsuario = valor;
                  });
                }),
            RaisedButton(
              child: Text("Salvar"),
                onPressed: (){
                  print("Escolha: " + _escolhaUsuario.toString());
            })
          ],
        ),
      ),
    );
  }
}
