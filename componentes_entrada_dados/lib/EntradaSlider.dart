import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {

  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Slider(
              value: _valor,
              min: 0,
              max: 10,
              divisions: 5,
              activeColor: Colors.red,
              onChanged: (double novoValor){
                setState(() {
                  _valor = novoValor;
                });
                print("Valor: " + novoValor.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
