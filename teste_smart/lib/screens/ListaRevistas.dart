
import 'package:flutter/material.dart';
import 'package:smartbr/Entities/Marca.dart';
import 'package:smartbr/Entities/Revista.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';

class ListaRevistas extends StatefulWidget {

  @override
  _ListaRevistasState createState() => _ListaRevistasState();
}

class _ListaRevistasState extends State<ListaRevistas> {

  List lista = [];

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;
    Marca marca = data["marca"];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "${marca.name}",
            style: TextStyle(fontSize: 25, color: branco),
          ),
        ),
      ),
      body: FutureBuilder<List<Revista>>(
        future: Metodos.recuperarRevistas(),
        // ignore: missing_return
        builder: (context, snapshot){
          switch( snapshot.connectionState ){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active :
            case ConnectionState.done :
              if( snapshot.hasError ){
                print(snapshot.error);
                return Text("lista: Erro ao carregar ");
              }else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){

                      List<Revista> lista = snapshot.data;
                      Revista revista = lista[index];

                      return ListTile(
                        onTap: (){
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Deseja visualizar a Revista de número ${revista.number}?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () async {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(context, '/Processos',
                                                arguments: {"idRevista": revista.number}
                                            );
                                        },
                                        child: Text("Sim")),
                                    FlatButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Não"))
                                  ],
                                );
                              });
                        },
                        contentPadding: EdgeInsets.only( left: 25),
                        title: Text( revista.number ),
                        subtitle: Text( revista.id.toString() ),
                      );

                    }
                );

              }
              break;
          }

        },
      ),
    );
  }
}