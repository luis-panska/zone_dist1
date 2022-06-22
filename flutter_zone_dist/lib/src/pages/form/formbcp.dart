import "package:flutter/material.dart";
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formbcp extends StatefulWidget {
  static String id = "Formbcp";

  const Formbcp({Key? key}) : super(key: key);

  @override
  _FormbcpState createState() => _FormbcpState();
}

class _FormbcpState extends State<Formbcp> {
  var cardMask = MaskTextInputFormatter(
      mask: '####-####-####-####', filter: {"#": RegExp(r'[0-9]')});
  var vardMask =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  var codeMask =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            child: ElevatedButton(onPressed: () {}, child: const Text("Pagar")),
          ),
        ],
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
              hintText: "Su Nombre", border: InputBorder.none),
        ));
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
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "0000-0000-0000-0000", border: InputBorder.none),
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
              hintText: "01/24", border: InputBorder.none),
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
        ));
  }
}
