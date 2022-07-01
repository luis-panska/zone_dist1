import 'package:flutter/material.dart';
import 'package:flutter_zone_dist/src/pages/form/formbcp.dart';
import 'package:flutter_zone_dist/src/pages/form/listform.dart';
import 'package:flutter_zone_dist/src/pages/form/listproduct.dart';
import 'package:flutter_zone_dist/src/pages/form_second/productos_page.dart';
import 'package:flutter_zone_dist/src/pages/present.dart';
import 'package:flutter_zone_dist/src/pages/comments.dart';
import 'package:flutter_zone_dist/src/pages/register.dart';
import 'package:flutter_zone_dist/src/pages/categorias.dart';
import 'package:flutter_zone_dist/src/pages/politic.dart';
import 'package:flutter_zone_dist/src/pages/noveded.dart';
import 'package:flutter_zone_dist/src/pages/form_second/categor1.dart';
import 'package:flutter_zone_dist/src/pages/form/listform.dart';

import 'src/pages/loginpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zone_dist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        Registro.id: (context) => Registro(),
        Present.id: (context) => Present(),
        Categorias.id: (context) => const Categorias(),
        Categor1.id: (context) => const Categor1(),
        ProductosPage.id: (context) => const ProductosPage(),
        Comments.id: (context) => Comments(),
        Politic.id: (context) => Politic(),
        Noveded.id: (context) => Noveded(),
        Listproduct.id: (context) => const Listproduct(),
        Formbcp.id: (context) => const Formbcp(
              categoryId: '',
            ),
        Listform.id: (context) => Listform(),
      },
    );
  }
}
