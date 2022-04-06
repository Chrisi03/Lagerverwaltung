import 'package:flutter/material.dart';
import 'package:lagerverwaltung/widgets/MyDrawer.dart';

class LagerPage extends StatelessWidget {
  static const route = '/lager';
  const LagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lagerverwaltung"),),
      body: Container(),
      drawer: MyDrawer(),
    );
  }
}
