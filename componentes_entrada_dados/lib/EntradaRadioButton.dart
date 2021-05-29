import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  int _escolhaUsuario = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrada de Dados'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              RadioListTile(
                  title: Text("Masculino"),
                  value: 0,
                  groupValue: _escolhaUsuario,
                  onChanged: (int? escolha) {
                    setState(() {
                      _escolhaUsuario = escolha!;
                    });
                  }),
              RadioListTile(
                  title: Text("Feminio"),
                  value: 1,
                  groupValue: _escolhaUsuario,
                  onChanged: (int? escolha) {
                    setState(() {
                      _escolhaUsuario = escolha!;
                    });
                  }),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                  print("Escolha do usuario" + _escolhaUsuario.toString());
                },
              )
            ],
          ),
        ));
  }
}
