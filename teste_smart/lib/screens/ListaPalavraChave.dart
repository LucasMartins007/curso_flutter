
import 'package:flutter/material.dart';
import 'package:smartbr/Entities/PalavraChave.dart';
import 'package:smartbr/globals/Metodos.dart';

class ListaPalavraChave extends StatefulWidget {
  @override
  _ListaPalavraChaveState createState() => _ListaPalavraChaveState();
}

class _ListaPalavraChaveState extends State<ListaPalavraChave> {

  List lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Palavras Chave"
          ),
        ),
      ),
      body: FutureBuilder<List<PalavraChave>>(
        future: Metodos.recuperarPalavraChave(),
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
                return Text("lista: Erro ao carregar");
              }else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){

                      List<PalavraChave> lista = snapshot.data;
                      PalavraChave palavraChave = lista[index];

                      return ListTile(

                        onLongPress: () async{
                            await Metodos.deletarPalavraChave(palavraChave.id, context);
                            Navigator.pushReplacementNamed(context, '/PalavrasChave');
                        },
                        contentPadding: EdgeInsets.only( left: 25),
                        title: Text( palavraChave.palavraChav ),
                        subtitle: Text("  "+palavraChave.id.toString() ),
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