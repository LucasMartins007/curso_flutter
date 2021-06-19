import 'package:flutter/material.dart';
import 'package:smartbr/Entities/Processo.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';

class TelaProcesso extends StatefulWidget {
  @override
  _TelaProcessoState createState() => _TelaProcessoState();
}

class _TelaProcessoState extends State<TelaProcesso> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    Processo processo = data["processo"];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Processo ${processo.numero}",
            style: TextStyle(fontSize: 25, color: branco),
          ),
        ),
      ),
      body: FutureBuilder<List<Processo>>(
        future: Metodos.recuperarProcessos(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text("lista: Erro ao carregar ");
              } else {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Nome Marca",
                            style: TextStyle(color: Colors.black, fontSize: 32),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "${processo.nomeMarca}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "Despacho",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 32),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "${processo.despacho}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "Palavra Chave",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 32),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "${processo.palavraChave}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "Processo Completo",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 32),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25 ,right: 50, left: 50),
                            child: Text(
                              "${processo.processoCompleto}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              break;
          }
        },
      ),
    );
  }
}
