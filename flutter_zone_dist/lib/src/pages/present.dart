import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/categorias.dart';
import 'package:flutter_zone_dist/src/pages/comments.dart';
import 'package:flutter_zone_dist/src/pages/form/formbcp.dart';
import 'package:flutter_zone_dist/src/pages/loginpage.dart';
import 'package:flutter_zone_dist/src/pages/politic.dart';

class Present extends StatefulWidget {
  static String id = "Present";

  @override
  _PresentState createState() => _PresentState();
}

class _PresentState extends State<Present> {
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
                    fontWeight: FontWeight.bold, fontSize: 28.0),
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
                              "Esta función no esta diponible por el momento"),
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
                        ));
              },
            ),
          ],
          backgroundColor: Colors.amberAccent,
        ),
        backgroundColor: Color.fromARGB(255, 223, 170, 188),
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
                color: Colors.amber,
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
              title: const Text("Comentarios"),
              onTap: () {
                showDialog(
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
                        ));
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: const Icon(Icons.book_online_outlined),
              title: const Text("Lineamientos y regularidades"),
              onTap: () {
                showDialog(
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
                        ));
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text("Novedades"),
              onTap: () {
                showDialog(
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
                        ));
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
                              onPressed: () {
                                setState(() {
                                  Navigator.pushNamed(context, LoginPage.id);
                                });
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
