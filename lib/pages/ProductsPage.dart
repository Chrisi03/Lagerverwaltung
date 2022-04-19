import 'package:flutter/material.dart';
import 'package:lagerverwaltung/provider/Artikel.dart';
import 'package:lagerverwaltung/widgets/MyDrawer.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  static const route = '/products';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artikel = Provider.of<Artikel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: artikel.all.length,
          itemBuilder: (_,index) {
            return ListTile(
              title: Text(artikel.all[index]),
            );
          }),
      drawer: MyDrawer(),
    );
  }
}
