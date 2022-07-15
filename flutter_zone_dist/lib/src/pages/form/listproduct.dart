import "package:flutter/material.dart";
import 'dart:async';

import 'package:flutter_zone_dist/src/pages/categorias.dart';
import 'package:flutter_zone_dist/src/pages/form/form_bank.dart';
import 'package:flutter_zone_dist/src/pages/form/listform.dart';
import 'package:flutter_zone_dist/src/pages/form/metodos_pago.dart';
import 'package:flutter_zone_dist/src/pages/form_second/categor1.dart';
import 'package:flutter_zone_dist/src/pages/form_second/productos_page.dart';

class Listproduct extends StatefulWidget {
  static String id = "Listproduct";

  final nombre;
  final precio;
  final imagen;

  const Listproduct({Key? key, this.nombre, this.precio, this.imagen})
      : super(key: key);

  @override
  _ListproductState createState() => _ListproductState();
}

class _ListproductState extends State<Listproduct> {
  double _counter = 0;
  double _total = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _calculator() {
    var numero1 = widget.precio;

    double numero2 = _counter;

    double resul = numero1 * numero2;

    setState(() {
      _total = resul;
      print(_total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Productos",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(255, 105, 208, 237),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Positioned(
                  top: 15.0,
                  right: 10.0,
                  bottom: 25,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 105, 208, 237),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(105, 0),
                            bottomLeft: Radius.elliptical(105, 0))),
                    height: MediaQuery.of(context).size.height - 110.0,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                  top: (MediaQuery.of(context).size.height / 2) - 30.0,
                  left: (MediaQuery.of(context).size.width / 2) + 20.0,
                  child: Hero(
                    tag: widget.imagen,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: const BorderRadius.all(
                            Radius.elliptical(6, 0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(widget.imagen),
                            fit: BoxFit.cover,
                          )),
                      height: 95.0,
                      width: 95.0,
                    ),
                  )),
              Positioned(
                top: 50.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.nombre,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.black)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        const Text("Precio: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.black)),
                        Text(widget.precio.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.black)),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text("Cantidad: $_counter",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.black)),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 196, 229, 130),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.blue,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(75, 0),
                            bottomLeft: Radius.elliptical(75, 0),
                          )),
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20.0,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline,
                                color: Color.fromARGB(149, 43, 65, 49)),
                            onPressed: () {
                              _incrementCounter();
                              _calculator();
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline,
                                color: Color.fromARGB(149, 43, 65, 49)),
                            onPressed: () {
                              _decrementCounter();
                              _calculator();
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      padding: const EdgeInsets.all(20.0),
                      height: 60.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.greenAccent,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(75.0),
                              bottomLeft: Radius.circular(25.0)),
                          color: Colors.green[700]),
                      child: Text("Total: $_total",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 10.0),
                        child: const Text("Pagar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10.0,
                      color: const Color.fromARGB(255, 29, 120, 194),
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, MetodosPago.id);
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
