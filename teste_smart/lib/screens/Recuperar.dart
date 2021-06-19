import 'package:flutter/material.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';



class Recuperar extends StatefulWidget {
  @override
  _RecuperarState createState() => _RecuperarState();
}

class _RecuperarState extends State<Recuperar> {
  TextEditingController _controllerEmail = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recuperar Senha"),
          ],
        ),
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: primaryColor),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Email",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      labelStyle: TextStyle(
                        color: primaryColor,
                        decorationColor: Colors.white,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    cursorColor: primaryColor,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: _controllerEmail,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 25)),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Enviar', style: TextStyle(
                    fontSize: 15
                )),
                onPressed: () {
                  Metodos.recuperar(_controllerEmail.text, context);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
