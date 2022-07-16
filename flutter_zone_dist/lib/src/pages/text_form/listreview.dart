import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/text_form/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("lib/assets/images/perro.png", "Luis Mamani",
            "18 años Ciclo III", "Programador del grupo"),
        Review("lib/assets/images/stich.png", "Percy Roger",
            "24 años Ciclo III", "Jefe de pruebas."),
        Review("lib/assets/images/nemo.png", "Cristopher Cabello",
            "20 años Ciclo III", "Realizador de testing."),
      ],
    );
  }
}
