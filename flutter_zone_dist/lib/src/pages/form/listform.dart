import "package:flutter/material.dart";

class Listform extends StatefulWidget {
  static String id = "Listform";
  @override
  _ListformState createState() => _ListformState();
}

class _ListformState extends State<Listform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(87, 239, 219, 219),
      appBar: AppBar(
        title: const Text(
          "Elegir forma de pago",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
