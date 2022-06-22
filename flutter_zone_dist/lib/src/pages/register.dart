import 'dart:developer';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zone_dist/src/pages/loginpage.dart';
import 'package:flutter_zone_dist/src/pages/present.dart';
import 'package:flutter_zone_dist/src/services/authservice.dart';

class Registro extends StatefulWidget {
  static String id = "Registro";

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  var username = "", email = "", password = "", phone = "";
  var nomMask = MaskTextInputFormatter(
      mask: '#########', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 127),
      appBar: AppBar(
        title: const Text(
          "Registro",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 126, 229, 63),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, LoginPage.id);
            });
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
        child: Column(
          children: <Widget>[
            _crearInput1(),
            const SizedBox(
              height: 20,
            ),
            _crearInput2(),
            const SizedBox(
              height: 20,
            ),
            _crearInput3(),
            const SizedBox(
              height: 20,
            ),
            _crearInput4(),
            const SizedBox(
              height: 50,
            ),
            _crearInput5(),
          ],
        ),
      )),
    );
  }

  Widget _crearInput1() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Color.fromARGB(255, 234, 182, 88),
          filled: true,
          labelText: "Correo electrónico",
          icon: Icon(
            Icons.email,
            color: Color.fromARGB(255, 200, 113, 47),
          ),
          hintText: "example@gmail.com",
        ),
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
      ),
    );
  }

  Widget _crearInput2() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Color.fromARGB(255, 234, 182, 88),
          filled: true,
          labelText: "Nombre de usuario",
          icon: Icon(Icons.account_circle,
              color: Color.fromARGB(255, 200, 113, 47)),
          hintText: "Usuario",
        ),
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
      ),
    );
  }

  Widget _crearInput3() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Color.fromARGB(255, 234, 182, 88),
          filled: true,
          labelText: "Password",
          icon: Icon(Icons.lock, color: Color.fromARGB(255, 200, 113, 47)),
          hintText: "Contraseña",
        ),
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
      ),
    );
  }

  Widget _crearInput4() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        inputFormatters: [nomMask],
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Color.fromARGB(255, 234, 182, 88),
          filled: true,
          labelText: "Numero de telefono",
          icon: Icon(Icons.phone_android,
              color: Color.fromARGB(255, 200, 113, 47)),
          hintText: "Telefono",
        ),
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
      ),
    );
  }

  Widget _crearInput5() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
          child: const Text(
            "Registrar",
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
        color: const Color.fromARGB(255, 126, 229, 63),
        onPressed: () {
          AuthService()
              .create(
            email: email,
            password: password,
            username: username,
            phone: phone,
          )
              .then((value) {
            log(value.toString());
            if (value != null) {
              if (value.data['ok']) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Registrado correctamente"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, LoginPage.id);
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
}
