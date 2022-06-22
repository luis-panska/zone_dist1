import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/present.dart';
import 'package:flutter_zone_dist/src/pages/register.dart';
import 'package:flutter_zone_dist/src/services/authservice.dart';
import "package:fluttertoast/fluttertoast.dart";

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "", password = "", token = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 99, 214, 113),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "lib/assets/images/logo_app.png",
                  height: 200.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              const SizedBox(
                height: 15,
              ),
              _passwordTextField(),
              const SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
              const SizedBox(
                height: 20.0,
              ),
              _bottonRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: "username@gmail.com",
            labelText: "Correo electronico",
          ),
          onChanged: (value) {
            name = value;
          },
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            hintText: "Contraseña",
            labelText: "Contraseña",
          ),
          onChanged: (value) {
            password = value;
          },
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
          child: const Text(
            "Ingresa, ya!",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10.0,
        color: Colors.blue,
        onPressed: () {
          AuthService()
              .login(
            name,
            password,
          )
              .then((value) {
            if (value != null) {
              if (value.data['ok']) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Bienvenido a Zone dist"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, Present.id);
                                  });
                                },
                                child: const Text("Ingresar"))
                          ],
                        ));
              } else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Error"),
                          content: Text(value.data['message']),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Aceptar"))
                          ],
                        ));
              }
            }
          });
        },
      );
    });
  }

  Widget _bottonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
          child: const Text(
            "Registrarse",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10.0,
        color: Colors.blue,
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, Registro.id);
          });
        },
      );
    });
  }
}
