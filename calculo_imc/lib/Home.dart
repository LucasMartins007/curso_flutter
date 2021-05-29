import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _mensagemResultado = "";

  void _calcular() {
    double? peso = double.tryParse(_controllerPeso.text);
    double? altura = double.tryParse(_controllerAltura.text);
    double imc = peso! / (altura! * altura);
    _mensagemResultado = _verificaPeso(imc);
  }

  String _verificaPeso(double imc) {
    if (imc < 18.5) {
      return "Abaixo do normal";
    }
    if (imc < 24.9) {
      return "Peso normal";
    }
    if (imc < 30) {
      return "Sobrepeso";
    }
    if (imc < 34.9) {
      return "Obesidade grau 1";
    }
    if (imc < 39.9) {
      return "Obesidade grau 2";
    }
    return "Obesidade grau 3";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculo IMC"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Calculo IMC",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Peso (KG)"),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              controller: _controllerPeso,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Altura"),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              controller: _controllerAltura,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Calcular", style: TextStyle(fontSize: 15),),
                onPressed: () {
                  setState(() {
                    _calcular();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                _mensagemResultado,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
