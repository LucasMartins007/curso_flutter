import 'package:flutter/material.dart';
import 'package:navegacao_por_rotas/Rotas.dart';

import 'Home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
