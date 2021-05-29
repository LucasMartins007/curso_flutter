import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
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
        decoration: BoxDecoration(color: Colors.black26),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(32),
                  child: Image.asset("imagens/usuario.png", height: 150, width: 150,),
                ),
                Padding(
                    padding: EdgeInsets.all(0),
                  child: TextFormField(
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Nome Completo",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                      )
                    ),
                    validator: (valor) {
                      if(valor!.isEmpty){
                        return "o nome é obrigatório!";
                      }
                      if(valor.length < 3){
                        return "Digite um nome de ao menos três caracteres!";
                      }
                      return null;
                    },
                  )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: _controllerCpf,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Digite seu CPF",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .add(Validar.CPF, msg: "Cpf não é válido!")
                            .valido(valor);
                      },
                    )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Digite seu E-mail",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .add(Validar.EMAIL, msg: "Email não é válido!")
                            .valido(valor);
                      },
                    )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: _controllerSenha,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Digite sua Senha",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      validator: (valor) {
                        return Validador()
                            .add(Validar.OBRIGATORIO,
                            msg: "Este campo é obrigatório!")
                            .add(Validar.EMAIL, msg: "Email não é válido!")
                            .valido(valor);
                      },
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
