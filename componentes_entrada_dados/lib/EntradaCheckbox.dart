
import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  @override
  _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool _sexoMasculino = false;
  bool _sexoFeminino = false;

  bool _alteraEstado(bool valor){
    if (valor){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrada de Dados"),),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text("Masculino"),
              activeColor: Colors.red,
              selected: true,
              value: _sexoMasculino,
              onChanged: (bool? valor){
                setState(() {
                  _sexoMasculino = false;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Feminino"),
              activeColor: Colors.red,
              selected: false,
              value: _sexoFeminino,
              onChanged: (bool? valor){
                setState(() {
                  _sexoFeminino = true;
                });
              },
            ),
            RaisedButton(
              child: Text("Salvar"),
                onPressed: () {
                  print("Sexo Masculino " +
                  _sexoMasculino.toString() +
                  " - " +
                  "Sexo Feminino " +
                  _sexoFeminino.toString());
                })
          ],
        ),
      ),
    );
  }
}
