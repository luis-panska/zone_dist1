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
        Review("lib/assets/images/perro.png", "Percy Roger",
            "18 años Ciclo III", "There is an amazing place in Sri Lanka."),
        Review("lib/assets/images/perro.png", "Cristopher Cabello",
            "18 años Ciclo III", "There is an amazing place in Sri Lanka."),
        Review("lib/assets/images/perro.png", "Henry Samir Villanueva",
            "Profesor de Certus", "Puse su nombre sin consentimiento."),
      ],
    );
  }
}
