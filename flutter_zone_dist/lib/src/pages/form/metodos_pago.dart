import "package:flutter/material.dart";
import 'package:flutter_zone_dist/src/models/method_response.dart';
import 'package:flutter_zone_dist/src/pages/form/form_bank.dart';
import 'package:flutter_zone_dist/src/services/methodservice.dart';

class MetodosPago extends StatefulWidget {
  static String id = "MetodosPago";

  const MetodosPago({Key? key}) : super(key: key);

  @override
  _MetodosPagoState createState() => _MetodosPagoState();
}

class _MetodosPagoState extends State<MetodosPago> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Selecciona",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(255, 105, 208, 237),
      ),
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
                FutureBuilder<MethodResponse?>(
                  future: MethodService().list(),
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
                            children: snapshot.data!.methodsPayment
                                .map((MethodsPayment methodsPayment) {
                              return _metodoItem(
                                  methodsPayment.id,
                                  methodsPayment.name,
                                  methodsPayment.description,
                                  methodsPayment.image,
                                  methodsPayment.imageForm);
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

  Widget _metodoItem(String idMethodPayment, String title, String description,
      String imgUrl, String imageForm) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
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
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    FormBank(methodFormImage: imageForm))),
                        child: Image.network(
                          imgUrl,
                          alignment: Alignment.center,
                          width: 66,
                          height: 66,
                        ),
                      ))),
            ),
            const Padding(
              padding: EdgeInsets.all(1.0),
            ),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black)),
            const Padding(
              padding: EdgeInsets.all(1.0),
            ),
            Text(description,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10.0,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
