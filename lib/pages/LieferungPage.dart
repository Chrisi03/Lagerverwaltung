import 'package:flutter/material.dart';

class LieferungPage extends StatelessWidget {
  static const route = '/lieferungen';
  const LieferungPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lieferungen'),
      ),
      body: Container(),
    );
  }
}
