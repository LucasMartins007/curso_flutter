
import 'package:flutter/material.dart';
import 'package:smartbr/screens/CadastroPalavraChave.dart';
import 'package:smartbr/screens/CadastroProcessoVerificado.dart';
import 'package:smartbr/screens/Home.dart';
import 'package:smartbr/screens/ListaMarcas.dart';
import 'package:smartbr/screens/ListaPalavraChave.dart';
import 'package:smartbr/screens/ListaProcesso.dart';
import 'package:smartbr/screens/ListaProcessosVerificados.dart';
import 'package:smartbr/screens/ListaRevistas.dart';
import 'package:smartbr/screens/Login.dart';
import 'package:smartbr/screens/Recuperar.dart';
import 'package:smartbr/screens/TelaProcesso.dart';


import 'globals/Colors.dart';


void main() {
  runApp(MaterialApp(
    title: 'SmartBR',
    theme: ThemeData(
      primarySwatch: primaryColor,
    ),
    initialRoute: '/Login',
    routes: {
      '/Login': (context) => Login(),
      '/Recuperar': (context) => Recuperar(),
      '/Home': (context) => Home(),
      '/Marcas': (context) => ListaMarcas(),
      '/Revistas': (context) => ListaRevistas(),
      '/Processos': (context) => ListaProcesso(),
      '/Processo': (context) => TelaProcesso(),
      '/ProcessoVerificado': (context) => CadastroProcessoVerificado(),
      '/ProcessosVerificados': (context) => ListaProcessosVerificados(),
      '/PalavraChave': (context) => CadastroPalavraChave(),
      '/PalavrasChave': (context) => ListaPalavraChave(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
