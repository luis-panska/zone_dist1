import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/models/category_response.dart';
import 'package:flutter_zone_dist/src/pages/form_second/productos_page.dart';
import 'package:flutter_zone_dist/src/services/categoryservice.dart';

class Categorias extends StatefulWidget {
  static String id = "Categorias";

  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          const SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: Row(
              children: const <Widget>[
                Text(
                  "Comida rapida",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 122.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              children: <Widget>[
                FutureBuilder<CategoryResponse?>(
                  future: CategoryService().list(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200.0,
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0.1,
                            childAspectRatio: 0.900,
                            children: snapshot.data!.categories
                                .map((Category category) {
                              return _comidaRap(category.id, category.name,
                                  category.description, category.image);
                            }).toList(),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _comidaRap(
      String idCategory, String text, String test, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: const Color.fromARGB(189, 255, 255, 255),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Hero(
              tag: imgUrl,
              child: Material(
                  child: Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap:
                            () => /* Navigator.pushNamed(
                            context, ProductosPage.id,
                            arguments: {
                              "idCategory": idCategory,
                            }), */
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductosPage(
                                          categoryId: idCategory,
                                        ))),
                        child: Image.network(
                          imgUrl,
                          alignment: Alignment.center,
                          width: 170,
                          height: 170,
                        ),
                      ))),
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
            ),
            Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.black)),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
