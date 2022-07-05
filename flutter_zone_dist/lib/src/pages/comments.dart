import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/present.dart';

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
              "Danos tu opinion".toUpperCase(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_open_rounded),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Regresar al inicio"),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text("si"),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Present.id);
                              });
                            },
                          ),
                          FlatButton(
                            child: const Text("no"),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Comments.id);
                              });
                            },
                          ),
                        ],
                      ));
            },
          ),
        ],
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Color.fromARGB(255, 223, 170, 188),
    );
  }
}
