import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';

class CadastroPalavraChave extends StatefulWidget {
  @override
  _CadastroPalavraChaveState createState() =>
      _CadastroPalavraChaveState();
}

class _CadastroPalavraChaveState
    extends State<CadastroPalavraChave> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _palavraController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cadastrar palavra chave",
            style: TextStyle(fontSize: 15, color: branco),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Favor inserir uma plavra chave valida';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Informe uma palavra chave'),
                      controller: _palavraController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Metodos.cadastrarPalavraChave(_palavraController.text, context);
                            setState(() {
                              _palavraController.text = "";
                            });
                          }
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
