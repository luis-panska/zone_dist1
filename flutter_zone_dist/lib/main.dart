import 'package:flutter/material.dart';
import 'package:flutter_zone_dist/src/pages/ant.dart';
import 'package:flutter_zone_dist/src/pages/form/form_bank.dart';
import 'package:flutter_zone_dist/src/pages/form/listform.dart';
import 'package:flutter_zone_dist/src/pages/form/listproduct.dart';
import 'package:flutter_zone_dist/src/pages/form/metodos_pago.dart';
import 'package:flutter_zone_dist/src/pages/form_second/productos_page.dart';
import 'package:flutter_zone_dist/src/pages/locate.dart';
import 'package:flutter_zone_dist/src/pages/present.dart';
import 'package:flutter_zone_dist/src/pages/comments.dart';
import 'package:flutter_zone_dist/src/pages/register.dart';
import 'package:flutter_zone_dist/src/pages/categorias.dart';
import 'package:flutter_zone_dist/src/pages/politic.dart';
import 'package:flutter_zone_dist/src/pages/noveded.dart';
import 'package:flutter_zone_dist/src/pages/form_second/categor1.dart';
import 'package:flutter_zone_dist/src/services/authservice.dart';
import 'src/pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.getToken();
  runApp(const MyApp());
}

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
      initialRoute: AuthService.token == '' ? LoginPage.id : Present.id,
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
        MetodosPago.id: (context) => const MetodosPago(),
        FormBank.id: (context) => const FormBank(
              methodFormImage: '',
            ),
        Listform.id: (context) => Listform(),
        Locate.id: (context) => Locate(),
        Ant.id: (context) => Ant(),
      },
    );
  }
}
