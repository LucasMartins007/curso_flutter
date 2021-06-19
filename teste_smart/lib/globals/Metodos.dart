
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartbr/Entities/Marca.dart';
import 'package:smartbr/Entities/PalavraChave.dart';
import 'package:smartbr/Entities/Processo.dart';
import 'package:smartbr/Entities/ProcessoVerificado.dart';
import 'package:smartbr/Entities/Revista.dart';

import 'Colors.dart';
import 'Variaveis.dart';

class Metodos {
  static Future<Map> _recuperarUsuario() async {
    http.Response response = await http.get("${url}users/1");
    return json.decode(response.body);
  }

  static Future<List<Marca>> recuperarMarcas() async {
    http.Response response = await http.get("${url}marcas");

    var dadosJson = json.decode(response.body);

    List<Marca> marcas = List();
    for (var marca in dadosJson) {
      Marca m = Marca(marca["id"], marca["name"]);
      marcas.add(m);
    }

    return marcas;
  }

  static deletarProcessoVerificado(id,context) async{
    try {
      http.Response response = await http.delete(
          url + "ProcessoVerificado/${id}"
      );
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Processo Para Verificar excluido com sucesso')));
    } on Exception catch (_) {
      print("Erro");
    }

  }

  static Future<List<ProcessoVerificado>> recuperarProcessoVerificado() async {
    http.Response response = await http.get("${url}ProcessoVerificado");

    var dadosJson = json.decode(response.body);

    List<ProcessoVerificado> processos = List();
    for (var processo in dadosJson) {
      ProcessoVerificado p = ProcessoVerificado(processo["id_processo_verificado"].toString(),
          processo["data_verificacao"].toString(),processo["numero_processo"].toString(), processo["id_usuario"].toString());
      processos.add(p);
    }
    return processos;
  }


  static deletarPalavraChave(id,context) async{
    try {
      http.Response response = await http.delete(
          url + "PalavraChave/${id}"
      );
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Palavra chave excluida com sucesso')));
    } on Exception catch (_) {
      print("Erro");
    }

  }

  static Future<List<PalavraChave>> recuperarPalavraChave() async {
    http.Response response = await http.get("${url}PalavraChave");

    var dadosJson = json.decode(response.body);

    List<PalavraChave> palavras = List();
    for (var palavra in dadosJson) {
      PalavraChave p = PalavraChave(palavra["id_palavra_chave"].toString(),
          palavra["palavra_chave"].toString(), palavra["id_usuario"].toString());
      palavras.add(p);
    }

    return palavras;
  }

  static Future<List<Revista>> recuperarRevistas() async {
    http.Response response = await http.get("${url}revistas");

    var dadosJson = json.decode(response.body);

    List<Revista> revistas = List();
    for (var revista in dadosJson) {
      Revista r = Revista(revista["id"].toString(),
          revista["number"].toString(), revista["idEmpresa"].toString());
      revistas.add(r);
    }

    return revistas;
  }

  static cadastrarProcessoVerificado(var controller, context) async {
    var corpo = json.encode({
      "id_processo_verificado": null,
      "data_verificacao": DateTime.now().toString(),
      "numero_processo": controller,
      "id_usuario": usuario.id
    });
    try {
      http.Response response = await http.post(url + "ProcessoVerificado",
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: corpo);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('processo cadastrado com sucesso')));
    } on Exception catch (_) {
      print("Erro");
    }
  }

  static cadastrarPalavraChave(var controller, context) async {
    var corpo = json.encode({
      "id_palavra_chave": null,
      "palavra_chave": controller,
      "id_usuario": usuario.id
    });
    try {
      http.Response response = await http.post(url + "PalavraChave",
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: corpo);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Palavra chave cadastrada com sucesso')));
    } on Exception catch (_) {
      print("Erro");
    }
  }

  static Future<List<Processo>> recuperarProcessos() async {
    http.Response response = await http.get("${url}processos");

    var dadosJson = json.decode(response.body);

    List<Processo> processos = List();
    for (var processo in dadosJson) {
      Processo p = Processo(
          processo["id"].toString(),
          processo["numero"].toString(),
          processo["nomeMarca"].toString(),
          processo["despacho"].toString(),
          processo["palavraChave"].toString(),
          processo["processoCompleto"].toString());

      processos.add(p);
    }
    return processos;
  }

  static recuperar(String email, context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Email de recuperação enviado para:"),
            titlePadding: EdgeInsets.all(25),
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.orange),
            content: FutureBuilder<Map>(
              future: _recuperarUsuario(),
              builder: (context, snapshot) {
                String resultado;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    print("Conexao waiting");
                    resultado = "carregando...";
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      resultado = "Erro ao carregar os dados";
                    } else {
                      String email = snapshot.data["email"];
                      resultado = " ${email.toString()}";
                    }
                    break;
                }

                return Center(
                  child: Text(resultado),
                );
              },
            ),
            actions: <Widget>[],
            contentPadding: EdgeInsets.all(20),
          );
        });
  }

  static _fecharPagina(context) async {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/Home');
  }

  static login(String login, String senha, context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Usuario Logado :"),
            titlePadding: EdgeInsets.all(25),
            titleTextStyle: TextStyle(fontSize: 20, color: textColor),
            content: FutureBuilder<Map>(
              future: _recuperarUsuario(),
              builder: (context, snapshot) {
                String resultado;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    print("Conexao waiting");
                    resultado = "carregando...";
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      resultado = "Erro ao carregar os dados.";
                    } else {
                      int id = int.tryParse(snapshot.data["id"]);
                      String email = snapshot.data["email"];
                      String password = snapshot.data["password"];
                      String name = snapshot.data["name"];
                      String empresa = snapshot.data["empresa"];
                      resultado =
                          "\nemail: ${email.toString()} \nnome: ${name.toString()}";
                      usuario.id = id;
                      usuario.email = email;
                      usuario.name = name;
                      usuario.password = password;
                      usuario.empresa = empresa;
                      _fecharPagina(context);
                    }
                    break;
                }

                return Center(
                  child: Text(resultado),
                );
              },
            ),
            actions: <Widget>[],
            contentPadding: EdgeInsets.all(20),
          );
        });
  }
}
