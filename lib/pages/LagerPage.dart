import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lagerverwaltung/provider/Lagern.dart';
import 'package:lagerverwaltung/widgets/GridViewChild.dart';
import 'package:lagerverwaltung/widgets/MyDrawer.dart';
import 'package:provider/provider.dart';

class LagerPage extends StatelessWidget {
  static const route = '/lager';
  const LagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lagerverwaltung"),),
      body: Consumer<Lagern>(
        builder: (context, lager, child) => GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (_, index) {
              return GridViewChild();
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
