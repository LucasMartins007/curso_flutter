
import 'package:flutter/material.dart';
import 'package:smartbr/Entities/ProcessoVerificado.dart';
import 'package:smartbr/globals/Metodos.dart';

class ListaProcessosVerificados extends StatefulWidget {
  @override
  _ListaProcessosVerificadosState createState() => _ListaProcessosVerificadosState();
}

class _ListaProcessosVerificadosState extends State<ListaProcessosVerificados> {

  List lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Processos Verificados"
          ),
        ),
      ),
      body: FutureBuilder<List<ProcessoVerificado>>(
        future: Metodos.recuperarProcessoVerificado(),
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

                      List<ProcessoVerificado> lista = snapshot.data;
                      ProcessoVerificado processoVerificado = lista[index];

                      return ListTile(

                        onLongPress: () async{
                            await Metodos.deletarProcessoVerificado(processoVerificado.id, context);
                            Navigator.pushReplacementNamed(context, '/ProcessosVerificados');
                        },
                        contentPadding: EdgeInsets.only( left: 25),
                        title: Text( processoVerificado.numero_processo ),
                        subtitle: Text("  "+processoVerificado.id.toString() ),
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