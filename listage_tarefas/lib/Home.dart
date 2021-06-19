// ignore: avoid_web_libraries_in_flutter
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List _listaTarefas = ["Estudar", "Jogar Futebol", "Limpar Casa"]; //lista de string
  List _listaTarefas = []; //lista de string
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory(); //pega o local do sistema operacional para salvar arquivos
    return File( "${diretorio.path}/dados.json" ); //retorna o arquivo em arquivo json
  }

  _salvarTarefa() async {
    String _textoDigitado = _controllerTarefa.text;
    //Criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = _textoDigitado;
    tarefa["realizada"] = false;
    setState(() {
      _listaTarefas.add( tarefa );
    });
    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dados = json.encode( _listaTarefas );
    arquivo.writeAsString( dados );
  }

  _lerArquivo() async {
    try{ //try catch é uma estrutura utilizada para tentar a execução de código e caso der erro retornamos um valor nulo
      final arquivo = await _getFile(); //caputra o local do arquivo no sistema operacional
      return arquivo.readAsString(); //lê como string
    }catch(e){
      return null;
    }

  }

  @override
  void initState() { //realiza alterações antes de carregar o build, carrega dados e entre outras funções
    super.initState();
    _lerArquivo().then( (dados){ //faz a leitura do arquivo
      setState(() {
        _listaTarefas = json.decode(dados); //carrega a lista de tarefas com o arquivo json
      });
    } );
  }

  Widget criarItemLista(context, index){

    final item = _listaTarefas[index]["titulo"];

    return Dismissible(
        key: Key(item),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){
          //Remove item da lista
          _listaTarefas.removeAt(index);
          _salvarArquivo();

        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
        child: CheckboxListTile(
          title: Text( _listaTarefas[index]['titulo'] ),
          value: _listaTarefas[index]['realizada'],
          onChanged: (valorAlterado){

            setState(() {
              _listaTarefas[index]['realizada'] = valorAlterado;
            });
            _salvarArquivo();

          },
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.purple, //cor do titulo do app
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, //botão no canto da tela
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: _controllerTarefa,
                      decoration: InputDecoration(
                          labelText: "Digite sua tarefa"
                      ),
                      onChanged: (text){

                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () => Navigator.pop(context) ,
                      ),
                      FlatButton(
                        child: Text("Salvar"),
                        onPressed: (){
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );

                }
            );

          }
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: criarItemLista
            ),
          )
        ],
      ),
    );
  }
}