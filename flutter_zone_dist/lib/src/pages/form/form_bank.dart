import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/ant.dart';
import 'package:flutter_zone_dist/src/pages/comments.dart';
import 'package:flutter_zone_dist/src/pages/form/listform.dart';
import 'package:flutter_zone_dist/src/pages/form/listproduct.dart';
import 'package:flutter_zone_dist/src/services/cardservice.dart';
import 'package:flutter_zone_dist/src/services/deliveryservice.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormBank extends StatefulWidget {
  static String id = "FormBank";

  final methodFormImage;
  const FormBank({Key? key, this.methodFormImage}) : super(key: key);

  @override
  _FormBankState createState() => _FormBankState();
}

class _FormBankState extends State<FormBank> {
  var name = "", avenida = "", telefono = "", fecha = "", pin = 0, userId = "";
  var phoneMask = MaskTextInputFormatter(
      mask: '#########', filter: {"#": RegExp(r'[0-9]')});
  var dateMask =
      MaskTextInputFormatter(mask: '##/##/##', filter: {"#": RegExp(r'[0-9]')});
  var pinMask =
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
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.methodFormImage,
              height: 200,
              width: 200,
            ),
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
                    DeliveryService()
                        .create(
                            identification: name,
                            address: avenida,
                            phone: telefono,
                            date: fecha,
                            pin: pin)
                        .then((value) {
                      if (value != null) {
                        if (value.data['ok']) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Pedido aceptado"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pushNamed(
                                                  context, Ant.id);
                                            });
                                          },
                                          child: const Text("Continuar"))
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
                  child: const Text("Confirmar datos")),
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
          inputFormatters: [phoneMask],
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "Telefono", border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              telefono = value;
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
          inputFormatters: [dateMask],
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "fecha", border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              fecha = value;
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
          inputFormatters: [pinMask],
          style: const TextStyle(fontSize: 15),
          decoration: const InputDecoration(
              hintText: "Num.domicilio", border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              pin = int.parse(value);
            });
          },
        ));
  }
}
