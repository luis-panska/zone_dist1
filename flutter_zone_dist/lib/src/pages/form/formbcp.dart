import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/form/listproduct.dart';
import 'package:flutter_zone_dist/src/services/cardservice.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formbcp extends StatefulWidget {
  static String id = "Formbcp";

  const Formbcp({Key? key, required String categoryId}) : super(key: key);

  @override
  _FormbcpState createState() => _FormbcpState();
}

class _FormbcpState extends State<Formbcp> {
  var name = "",
      number = "",
      avenida = "",
      expiration = "",
      cvv = 0,
      userId = "";
  var nameMask = MaskTextInputFormatter(
      mask: '####### ###############', filter: {"#": RegExp(r'[0-9]')});
  var cardMask = MaskTextInputFormatter(
      mask: '#########', filter: {"#": RegExp(r'[0-9]')});
  var avenidaMask = MaskTextInputFormatter(
      mask: '##.####################', filter: {"#": RegExp(r'[0-9]')});
  var vardMask =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  var codeMask =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forma de Pago",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, Listproduct.id);
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("lib/assets/images/bcp_card.png"),
            const SizedBox(
              height: 20,
            ),
            _inputname(),
            const SizedBox(
              height: 20,
            ),
            _inputavenida(),
            const SizedBox(
              height: 20,
            ),
            _inputTar(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: _inputDate(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: _inputCote(),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                  onPressed: () {
                    CreditCardService()
                        .create(
                            name: name,
                            number: number,
                            avenida: avenida,
                            expiration: expiration,
                            cvv: cvv,
                            userId: userId)
                        .then((value) {
                      if (value != null) {
                        if (value.data['ok']) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                        "Validación de datos correcta"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text("Ok"))
                                    ],
                                  ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Error"),
                                    content: Text(value.data['message']),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Aceptar"))
                                    ],
                                  ));
                        }
                      }
                    });
                  },
                  child: const Text("Pagar")),
            ),
          ],
        ),
      ),
    );
  }

  Container _inputname() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        inputFormatters: [nameMask],
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            hintText: "Nombre de identificación", border: InputBorder.none),
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
      ),
    );
  }

  Container _inputavenida() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        inputFormatters: [nameMask],
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            hintText: "Av.dirección", border: InputBorder.none),
        onChanged: (value) {
          setState(() {
            avenida = value;
          });
        },
      ),
    );
  }

  Container _inputTar() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [cardMask],
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "Telefono", border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              number = value;
            });
          },
        ));
  }

  Container _inputDate() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [vardMask],
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "fecha", border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              expiration = value;
            });
          },
        ));
  }

  Container _inputCote() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [codeMask],
          style: const TextStyle(fontSize: 20),
          decoration:
              const InputDecoration(hintText: "****", border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              cvv = int.parse(value);
            });
          },
        ));
  }
}
