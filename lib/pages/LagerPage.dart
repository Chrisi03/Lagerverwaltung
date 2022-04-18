import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  @override
  void initState() {
    _futureChats = Provider.of<Lagern>(context, listen: false).loadLager();
  }

  @override
  Widget build(BuildContext context) {
    final lager = Provider.of<Lagern>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lagerverwaltung"),
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
                          crossAxisCount: 1),
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (_, index) {
                        print(lager.all.length);
                        return GridViewChild();
                      },
                    ),
                  );
          }),
      drawer: MyDrawer(),
    );
  }
}
