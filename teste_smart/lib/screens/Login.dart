import 'package:flutter/material.dart';
import 'package:smartbr/globals/Colors.dart';
import 'package:smartbr/globals/Metodos.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      labelText: "Login",
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
                    controller: _controllerLogin,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: primaryColor),
                  child: TextField(
                    obscureText: _showPassword == false ? true : false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _showPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primaryColor,
                        ),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
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
                    controller: _controllerPassword,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              GestureDetector(
                  child: Row(children: <Widget>[
                    Text("Esqueceu sua senha?",
                        style: TextStyle(
                          fontSize: 10,
                        ))
                  ]),
                  onTap: () {
                    Navigator.pushNamed(context, '/Recuperar');
                  }),
              Padding(padding: EdgeInsets.only(top: 25)),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Entrar',
                  style: TextStyle(
                      fontSize: 15
                  ),),
                onPressed: () {
                  Metodos.login(_controllerLogin.text,
                      _controllerPassword.text, context);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
