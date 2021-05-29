import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/Validador.dart';

import 'Home.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final _formKey = GlobalKey<FormState>();

  void _irParaHome() {
//Navegação de tela
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCPF = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuário"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.black54),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.stretch, //alinhamento em alongamento
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Image.asset(
                      "imagens/usuario.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _controllerNome,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome Completo",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .minLength(3)
                            .valido(valor);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _controllerCPF,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        CpfInputFormatter()
                      ],
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "CPF",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .add(Validar.CPF, msg: "CPF não é valido!")
                            .valido(valor);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .add(Validar.EMAIL, msg: "E-mail não é valido!")
                            .valido(valor);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _controllerSenha,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Senha",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .valido(valor);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RaisedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blueGrey,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _irParaHome();
                        }
                      },
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}