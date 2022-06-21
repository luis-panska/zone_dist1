import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/models/products_by_category_response.dart';
import 'package:flutter_zone_dist/src/pages/form/listproduct.dart';
import 'package:flutter_zone_dist/src/services/categoryservice.dart';

class ProductosPage extends StatefulWidget {
  static String id = "ProductosPage";

  final categoryId;

  // const ProductosPage({Key? key}) : super(key: key);
  const ProductosPage({Key? key, this.categoryId}) : super(key: key);

  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  @override
  Widget build(BuildContext context) {
    /* final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var idCategory = arguments['idCategory'];
    log('idCategory: $idCategory');
    if (idCategory == null) {
      idCategory = "none-id";
    } */
    // navigato if (idCategory == null)
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
                  "Burger King - Productos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
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
                FutureBuilder<ProductsByCategoryResponse?>(
                  future: CategoryService()
                      .listProductsByCategory(widget.categoryId),
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
                            children:
                                snapshot.data!.products.map((Product product) {
                              return _comidaRap1(
                                  product.id,
                                  product.name,
                                  product.price,
                                  product.description,
                                  product.image);
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

  Widget _comidaRap1(String productId, String nombre, double precio,
      String descripcion, String imagen) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: const Color.fromARGB(189, 255, 255, 255),
          elevation: 5,
          child: Column(
            children: <Widget>[
              Hero(
                tag: imagen,
                child: Material(
                    child: Container(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Listproduct(
                                        nombre: nombre,
                                        precio: precio,
                                        imagen: imagen,
                                      ))),
                          child: Image.network(
                            imagen,
                            alignment: Alignment.center,
                            width: 170,
                            height: 170,
                          ),
                        ))),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
              ),
              Text(nombre,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.black)),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(precio.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                      color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
