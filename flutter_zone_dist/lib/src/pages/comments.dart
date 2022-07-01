import "package:flutter/material.dart";

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
        title: const Text(
          "Regresar",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
