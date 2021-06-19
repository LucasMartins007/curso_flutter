
import 'package:flutter/material.dart';
import 'package:smartbr/Entities/Processo.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';

class ListaProcesso extends StatefulWidget {

  @override
  _ListaProcessoState createState() => _ListaProcessoState();
}

class _ListaProcessoState extends State<ListaProcesso> {

  @override
  Widget build(BuildContext context) {

    Object data = ModalRoute.of(context).settings.arguments;
    //String idRevista = data["idRevista"];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Revista número", //${idRevista}",
            style: TextStyle(fontSize: 25, color: branco),
          ),
        ),
      ),
      body: FutureBuilder<List<Processo>>(
        future: Metodos.recuperarProcessos(),
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

                      List<Processo> lista = snapshot.data;
                      Processo processo = lista[index];

                      return ListTile(
                        onTap: (){
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Deseja visualizar o processo de número ${processo.numero}?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, '/Processo',
                                              arguments: {"processo": processo}
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
                        title: Text( processo.numero ),
                        subtitle: Text( processo.id.toString() ),
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