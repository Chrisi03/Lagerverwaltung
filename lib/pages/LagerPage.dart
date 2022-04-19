import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lagerverwaltung/pages/AddLager.dart';
import 'package:lagerverwaltung/provider/Lagern.dart';
import 'package:lagerverwaltung/widgets/GridViewChild.dart';
import 'package:lagerverwaltung/widgets/MyDrawer.dart';
import 'package:provider/provider.dart';

class LagerPage extends StatefulWidget {
  static const route = '/lager';

  const LagerPage({Key? key}) : super(key: key);

  @override
  State<LagerPage> createState() => _LagerPageState();
}

class _LagerPageState extends State<LagerPage> {
  late Future _futureChats;
  late Timer timer;

  @override
  void initState() {
    Provider.of<Lagern>(context, listen: false).context = context;

    _futureChats = Provider.of<Lagern>(context, listen: false).loadLager();

    timer = Timer.periodic(Duration(seconds: 5), (_) {
      _futureChats = Provider.of<Lagern>(context, listen: false).loadLager();
      print('test');
    });
  }

  @override
  void dispose() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final lager = Provider.of<Lagern>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lagerverwaltung"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddLager()));
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
          future: _futureChats,
          builder: (_, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Lagern>(
                    builder: (context, lager, child) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      scrollDirection: Axis.vertical,
                      itemCount: lager.all.length,
                      itemBuilder: (_, index) {
                        return GridViewChild(lager.all[index]);
                      },
                    ),
                  );
          }),
      drawer: MyDrawer(),
    );
  }
}
