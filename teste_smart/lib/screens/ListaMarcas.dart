
import'package:flutter/material.dart';
import 'package:smartbr/Entities/Marca.dart';
import 'package:smartbr/globals/Metodos.dart';


class ListaMarcas extends StatefulWidget {
  @override
  _ListaMarcasState createState() => _ListaMarcasState();
}

class _ListaMarcasState extends State<ListaMarcas> {

  List lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Alertas de marcas INPI \n     Selecione a marca"
          ),
        ),
      ),
      body: FutureBuilder<List<Marca>>(
        future: Metodos.recuperarMarcas(),
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

                      List<Marca> lista = snapshot.data;
                      Marca marca = lista[index];

                      return ListTile(

                        onTap: (){
                          Navigator.pushNamed(context, '/Revistas',
                          arguments: {"marca": marca}
                          );
                        },
                        contentPadding: EdgeInsets.only( left: 25),
                        title: Text( marca.name ),
                        subtitle: Text("  "+marca.id.toString() ),
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