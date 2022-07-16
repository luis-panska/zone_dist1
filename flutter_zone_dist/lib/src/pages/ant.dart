import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/locate.dart';
import 'package:flutter_zone_dist/src/pages/present.dart';
import 'package:flutter_zone_dist/src/pages/text_form/mapasdesc.dart';
import 'package:flutter_zone_dist/src/pages/text_form/present_dest.dart';
import 'dart:async';

class Ant extends StatefulWidget {
  static String id = "ant";

  final nombre;
  final precio;
  const Ant({Key? key, this.nombre, this.precio}) : super(key: key);
  @override
  _AntState createState() => _AntState();
}

class _AntState extends State<Ant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        centerTitle: true,
        title: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Datos confirmados".toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_open_rounded, color: Colors.black),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Regresar al inicio"),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text("si"),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Present.id);
                              });
                            },
                          ),
                          FlatButton(
                            child: const Text("no"),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Ant.id);
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
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              MapasDesc("Pantalla de vista",
                  "Se puede apreciar la cateogira, el producto, el consto de este + el envio, la modalidad de pago será que el repartidor llegara con un OPS atu hogar para que puedas pagar en la puerta de tu casa, gracias por llegar hasta aqui."),
              /*  Positioned(
                top: 20.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.nombre,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.black)),
                  ],
                ),
              ),*/
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 39, 169),
        foregroundColor: const Color.fromARGB(240, 244, 198, 11),
        child: const Icon(Icons.pan_tool_alt_sharp),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("¿Visualizar el producto?"),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text("si"),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, Locate.id);
                          });
                        },
                      ),
                      FlatButton(
                        child: const Text("no"),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, Ant.id);
                          });
                        },
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}
