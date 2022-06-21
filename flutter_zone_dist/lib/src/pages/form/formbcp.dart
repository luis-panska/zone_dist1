import "package:flutter/material.dart";

class Formbcp extends StatefulWidget {
  static String id = "Formbcp";

  const Formbcp({Key? key}) : super(key: key);

  @override
  _FormbcpState createState() => _FormbcpState();
}

class _FormbcpState extends State<Formbcp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("lib/assets/images/bcp_card.png"),
        const SizedBox(
          height: 20,
        ),
        _inputname(),
        _inputTar(),
      ],
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
          decoration: InputDecoration(border: InputBorder.none),
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
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(border: InputBorder.none),
        ));
  }
}
