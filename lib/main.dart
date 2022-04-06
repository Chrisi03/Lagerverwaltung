import 'package:flutter/material.dart';
import 'package:lagerverwaltung/pages/LagerPage.dart';
import 'package:lagerverwaltung/pages/LieferungPage.dart';
import 'package:lagerverwaltung/pages/ProductsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LagerPage(),
        LieferungPage.route: (context) => LieferungPage(),
        ProductsPage.route: (context) => ProductsPage(),
      },
    );
  }
}
