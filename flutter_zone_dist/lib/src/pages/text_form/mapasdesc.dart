import 'dart:ui';

import "package:flutter/material.dart";

class MapasDesc extends StatelessWidget {
  String name;
  String description;

  MapasDesc(this.name, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStar = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            top: 50.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            name,
            style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
    final contenido = Container(
      margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 23, 26, 13),
        ),
      ),
    );

    return Column(
      children: <Widget>[titleStar, contenido],
    );
  }
}
