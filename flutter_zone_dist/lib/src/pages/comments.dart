import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/present.dart';
import 'package:flutter_zone_dist/src/pages/text_form/description.dart';
import 'package:flutter_zone_dist/src/pages/text_form/listreview.dart';

class Comments extends StatefulWidget {
  static String id = "Comments";
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
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
              "¿Quienes somos?".toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.black),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, Present.id);
            });
          },
        ),
        backgroundColor: Color.fromARGB(255, 105, 208, 237),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Description("Sobre nosotros", 1,
                  "Esto es una app de delivery, donde se puso aprueba lo aprendido en clase tanto para hacer requerimientos funcionales como no funcionales, el desarrollo de esto es de aprox 9 horas de programación."),
              ReviewList(),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white70,
    );
  }
}
