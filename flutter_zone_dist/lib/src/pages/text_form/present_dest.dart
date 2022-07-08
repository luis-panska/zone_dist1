import 'dart:ui';

import "package:flutter/material.dart";

class presentDesc extends StatelessWidget {
  String name;
  int stars;
  String description;

  presentDesc(this.name, this.stars, this.description, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final star_half = Container(
      margin: const EdgeInsets.only(
        top: 50.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star_half,
        color: Colors.amberAccent,
      ),
    );
    final star_border = Container(
      margin: const EdgeInsets.only(
        top: 50.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star_border,
        color: Colors.amberAccent,
      ),
    );

    final star = Container(
      margin: const EdgeInsets.only(
        top: 50.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star,
        color: Colors.amberAccent,
      ),
    );

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
        Row(
          children: <Widget>[star, star, star, star_half, star_border],
        )
      ],
    );
    final contenido = Container(
      margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.normal,
          color: Colors.black45,
        ),
      ),
    );

    return Column(
      children: <Widget>[titleStar, contenido],
    );
  }
}
