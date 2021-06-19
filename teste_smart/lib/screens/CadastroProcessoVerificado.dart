import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';

class CadastroProcessoVerificado extends StatefulWidget {
  @override
  _CadastroProcessoVerificadoState createState() =>
      _CadastroProcessoVerificadoState();
}

class _CadastroProcessoVerificadoState
    extends State<CadastroProcessoVerificado> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _numeroController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cadastrar processo para verificação",
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
                          return 'Favor inserir um número válido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Informe o número do processo'),
                      controller: _numeroController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Metodos.cadastrarProcessoVerificado(_numeroController.text, context);
                            setState(() {
                              _numeroController.text = "";
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
