import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemAplicativo = AssetImage("imagens/padrao.jpg");
  var _mensagem = "Escolha uma das opções abaixo: ";
  var _vitorias = 0;
  var _derrotas = 0;
  var _empates = 0;

  void _resetarValores() {
    setState(() {
      this._vitorias = 0;
      this._empates = 0;
      this._derrotas = 0;
    });
  }

  void _exibirResultado(String _escolhaUsuario, String _escolhaApp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(_verificaResultado(_escolhaUsuario, _escolhaApp)),
        );
      },
    );
  }

  String _verificaResultado(String _escolhaUsuario, String _escolhaApp) {
    if (_isEmpate(_escolhaUsuario, _escolhaApp)) {
      _empates++;
      return "Você empatou!";
    }
    if (_isVitoria(_escolhaUsuario, _escolhaApp)) {
      _vitorias++;
      return "Você Venceu!";
    }
    _derrotas++;
    return "Você Perdeu!";
  }

  bool _isEmpate(String _escolhaUsuario, String _escolhaApp) {
    if (_escolhaUsuario == "pedra" && _escolhaApp == "pedra") {
      return true;
    }
    if (_escolhaUsuario == "papel" && _escolhaApp == "papel") {
      return true;
    }
    if (_escolhaUsuario == "tesoura" && _escolhaApp == "tesoura") {
      return true;
    }
    return false;
  }

  bool _isVitoria(String _escolhaUsuario, String _escolhaApp) {
    if (_escolhaUsuario == "pedra" && _escolhaApp == "tesoura") {
      return true;
    }
    if (_escolhaUsuario == "papel" && _escolhaApp == "pedra") {
      return true;
    }
    if (_escolhaUsuario == "tesoura" && _escolhaApp == "papel") {
      return true;
    }
    return false;
  }

  void _opcaoSelecionada(String _escolhaUsuario) {
    var _opcoes = ["pedra", "papel", "tesoura"];
    var _numero = Random().nextInt(3);
    var _escolhaApp = _opcoes[_numero];

    switch (_escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemAplicativo = AssetImage("imagens/Pedra.jpg");
        });
        break;
      case "papel":
        setState(() {
          this._imagemAplicativo = AssetImage("imagens/Papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemAplicativo = AssetImage("imagens/Tesoura.png");
        });
        break;
    }

    sleep(Duration(milliseconds: 300));

    _exibirResultado(_escolhaUsuario, _escolhaApp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokempo - Flutter teste"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemAplicativo),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagens/Papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagens/Pedra.jpg",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagens/Tesoura.png",
                  height: 100,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 5),
            child: Text(
              "Você Venceu: " + _vitorias.toString() + " vezes..",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 5),
            child: Text(
              "Você Perdeu: " + _derrotas.toString() + " vezes..",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 50),
            child: Text(
              "Você Empatou: " + _empates.toString() + " vezes..",
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
          ),
          ElevatedButton(
              onPressed: () => _resetarValores(),
              child: Text("Resetar placar"),
          ),
        ],
      ),
    );
  }

}
