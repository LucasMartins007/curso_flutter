import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _ret = "";

  _recuperarBancoDados() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados!, "banco.db");

    var bd = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (db, dbVersaoRecente){
          String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
          db.execute(sql);
        }
    );
    return bd;
  }

  _salvar() async {

    Database bd = await _recuperarBancoDados(); //recupera instancia de dados
    Map<String, dynamic> dadosUsuario = {"nome" : "testes", "idade" : 63};

    await bd.insert("usuarios", dadosUsuario);

    setState(() {
      _ret = dadosUsuario.toString();
    });


  }

  _listarUsuarios() async {

    Database bd = await _recuperarBancoDados();
    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);

    setState(() {
      _ret =  usuarios.toString();
    });

  }

  _excluirUsuario() async {
    Database bd = await _recuperarBancoDados();
    int retorno = await bd.delete("usuarios");
    setState(() {
      _ret = retorno.toString();
    });

  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome" : "Lucas Rodrigues Martins de Oliveira",
      "idade" : 18
    };
    int retorno = await bd.update(
        "usuarios",
        dadosUsuario,
        where: "id = 38"
    );
    String _sql = "SELECT * FROM usuarios WHERE id = 38";
    List<Map<String, dynamic>> data = await bd.rawQuery(_sql);
    setState(() {
      _ret = data.toString();
    });
  }

  widgetTextField() {
    return TextField(
      decoration:
      InputDecoration(border: InputBorder.none,
          icon: Icon(Icons.person),
          hintText: 'Informe o nome'),
    );
  }


  @override
  Widget build(BuildContext context) {

    _recuperarBancoDados();

    return Scaffold(
      appBar: AppBar(
        title: Text("Banco de Dados - SQFLITE"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                TextField(
                    onChanged: (text) {
                      print("TextField: $text");
                    }
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: (){
                      _salvar();
                    },
                    color: Colors.blue,
                    child: Text("Salvar"),),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: (){
                      _atualizarUsuario(1);
                    },
                    color: Colors.blue,
                    child: Text("Atualizar"),),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: (){
                      _excluirUsuario();
                    },
                    color: Colors.blue,
                    child: Text("Excluir"),),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: (){
                      _listarUsuarios();
                    },
                    color: Colors.blue,
                    child: Text("Listar"),),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Text("RESULTADO : " + _ret.toString(),),
            ),
          ],
        ),
      ),
    );
  }
}