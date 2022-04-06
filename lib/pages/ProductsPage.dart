import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  static const route = '/products';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Container(),
    );
  }
}
