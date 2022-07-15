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
      backgroundColor: Colors.white,
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
        backgroundColor: Color.fromARGB(255, 105, 208, 237),
      ),
    );
  }
}
