import 'package:flutter/material.dart';
import 'package:smartbr/globals/Variaveis.dart';

class DrawerComun extends StatefulWidget {
  @override
  _DrawerComunState createState() => _DrawerComunState();
}

class _DrawerComunState extends State<DrawerComun> {
  void _voltarTelaLogin() async {
    Navigator.pushReplacementNamed(context, '/Login');
  }

  _deslogar() async {
    _voltarTelaLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  child: Text(
                    '${usuario.name[0].toUpperCase()}',
                    style: TextStyle(fontSize: 80),
                  ),
                  minRadius: 50,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Usuário: ${usuario.name}")
              ],
            ),
          ),
          ListTile(
              leading: Icon(Icons.assignment_late),
              title: Text("Marcas"),
              subtitle: Text("Visualizar Marcas"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushNamed(context, "/Marcas");

              }),
          ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Palavras Chave"),
              subtitle: Text("Visualizar lista de palavras chave"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushNamed(context, "/PalavrasChave");

              }),
          ListTile(
              leading: Icon(Icons.playlist_add),
              title: Text("Palavra Chave"),
              subtitle: Text("Cadastrar palavra chave"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushNamed(context, "/PalavraChave");

              }),
          ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Processos para Verificar"),
              subtitle: Text("Visualizar lista de processos para verificar"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushNamed(context, "/ProcessosVerificados");

              }),
          ListTile(
              leading: Icon(Icons.playlist_add),
              title: Text("Processo para Verificar"),
              subtitle: Text("Cadastrar processo para verificar"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushNamed(context, "/ProcessoVerificado");

              }),


          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              subtitle: Text("Encerrar Sessão"),
              trailing: Icon(Icons.arrow_forward),
              onTap: _deslogar),

        ],
      ),
    );
  }
}