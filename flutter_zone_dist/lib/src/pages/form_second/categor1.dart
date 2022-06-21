import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/pages/form/listproduct.dart';

class Categor1 extends StatefulWidget {
  static String id = "Categor1";

  const Categor1({Key? key, String? test, String? text, String? imag})
      : super(key: key);

  @override
  _Categor1State createState() => _Categor1State();
}

class _Categor1State extends State<Categor1> {
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
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 200.0,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.1,
                      childAspectRatio: 0.900,
                      children: <Widget>[
                        _comidaRap1("Combo 1", 26,
                            "assets/images/lib/categori1-product1.png"),
                        _comidaRap1("Combo 2", 14,
                            "lib/assets/images/categori1-product2.png"),
                        _comidaRap1("Combo 3", 14,
                            "lib/assets/images/categori1-product3.png"),
                        _comidaRap1("Combo 4", 47,
                            "lib/assets/images/categori1-product4.png"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _comidaRap1(String nombre, int precio, String imagen) {
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
                          child: Image.asset(
                            imagen,
                            fit: BoxFit.contain,
                            width: 160,
                            height: 165,
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
