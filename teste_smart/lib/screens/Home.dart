import'package:flutter/material.dart';
import 'package:smartbr/globals/Widgets.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Menu Principal"),
            ],
          ),
        ),
        drawer: DrawerComun());
  }
}
