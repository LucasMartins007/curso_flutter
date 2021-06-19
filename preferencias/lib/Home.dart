import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerTexto = TextEditingController();
  String _texto = "Nada slavo";

  _salvar() async {
    String _valorDigital = _controllerTexto.text;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("nome", _valorDigital);

    print("salvar: $_valorDigital");
  }

  _recuperar() async {
    final preferences = await SharedPreferences.getInstance();

    setState(() {
      _texto = preferences.getString("nome") ?? "Sem Valor!";
    });
  }

  _remover() async {
    final preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.remove("nome");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados - preferencias"),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text(_texto),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome Completo"),
              controller: _controllerTexto,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    color: Colors.black26,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(14),
                    child: Text(
                      "Salvar",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      _salvar();
                    }),
                RaisedButton(
                    color: Colors.black26,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(14),
                    child: Text(
                      "Remover",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      _remover();
                    }),
                RaisedButton(
                    color: Colors.black26,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(14),
                    child: Text(
                      "Recuperar",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      _recuperar();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
