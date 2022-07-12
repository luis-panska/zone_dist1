import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/categorias.dart';
import 'package:flutter_zone_dist/src/pages/comments.dart';
import 'package:flutter_zone_dist/src/pages/form/form_bank.dart';
import 'package:flutter_zone_dist/src/pages/locate.dart';
import 'package:flutter_zone_dist/src/pages/loginpage.dart';
import 'package:flutter_zone_dist/src/pages/politic.dart';
import 'package:flutter_zone_dist/src/pages/text_form/description.dart';
import 'package:flutter_zone_dist/src/pages/text_form/present_dest.dart';
import 'package:flutter_zone_dist/src/services/authservice.dart';

import 'package:url_launcher/url_launcher.dart';

final Uri _urlPaginaWeb = Uri.parse('https://flutter.dev');

class Present extends StatefulWidget {
  static String id = "Present";

  @override
  _PresentState createState() => _PresentState();
}

class _PresentState extends State<Present> {
  String presentNeto =
      "Esto es una app de delivery, donde se puso a prueba lo aprendido en clase tanto para hacer requerimientos funcionales como no funcionales, la valoración que se hizo a usuarios es de 3 estrellas y media, los datos que se guardan no son publicos y la información que se coloque nos permitira conocer mas al usuario y asi ir mejorando de a poco la app, se pregunto a un externo el tema de colores y cosas que queria que hiciera la app , segun eso se estuvo avanzando.";

  void goToPageWeb() async {
    if (!await launchUrl(_urlPaginaWeb)) {
      throw 'Nose pudo ingresar $_urlPaginaWeb';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          centerTitle: true,
          title: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Presentación".toUpperCase(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.local_airport),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                              "Esta función te permite regresar a la ventana anterior"),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text("Regresar"),
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                          ],
                        ));
              },
            ),
          ],
          backgroundColor: Color.fromARGB(255, 105, 208, 237),
        ),
        body: presentDesc("Bienvenido", 5, presentNeto),
        floatingActionButton: RaisedButton(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
              child: const Text(
                "Página web",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            elevation: 10.0,
            color: Colors.blue,
            onPressed: goToPageWeb
            /* showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Esto aun no esta disponible"),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text("Regresar"),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(context, Present.id);
                            });
                          },
                        ),
                      ],
                    )); */

            ),
        backgroundColor: Colors.white70,
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset("lib/assets/images/logo_app.png"),
                  ),
                  const Text("!Bienvenido"),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 105, 208, 237),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.category_outlined),
              title: const Text("Categorias de productos"),
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, Categorias.id);
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: const Icon(Icons.comment_bank_outlined),
              title: const Text("Sobre nosotros"),
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, Comments.id);
                });
              },
            ),
            const SizedBox(
              height: 240.0,
            ),
            ListTile(
              leading: const Icon(Icons.logo_dev_outlined),
              title: const Text("Sign up"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Estas seguro que quieres salir?"),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text("Si"),
                              onPressed: () async {
                                await AuthService.logout();
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                            ),
                            FlatButton(
                              child: const Text("No"),
                              onPressed: () {
                                setState(() {
                                  Navigator.pushNamed(context, Present.id);
                                });
                              },
                            ),
                          ],
                        ));
              },
            ),
          ],
        )),
      ),
    );
  }
}
