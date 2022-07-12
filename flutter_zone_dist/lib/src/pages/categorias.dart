import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/models/category_response.dart';
import 'package:flutter_zone_dist/src/pages/form_second/productos_page.dart';
import 'package:flutter_zone_dist/src/pages/present.dart';
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
      appBar: AppBar(
        title: const Text(
          "Categorias",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 105, 208, 237),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      backgroundColor: Colors.white70,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          const SizedBox(
            height: 25.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 122.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 105, 208, 237),
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
                        padding: const EdgeInsets.only(top: 20.0),
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
      String idCategory, String title, String description, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
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
                          width: 65,
                          height: 65,
                        ),
                      ))),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
            ),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black)),
            const Padding(
              padding: EdgeInsets.all(2.0),
            ),
            Text(description,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
