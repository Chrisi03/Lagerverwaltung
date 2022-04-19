import 'package:flutter/material.dart';
import 'package:lagerverwaltung/domains/Lager.dart';
import 'package:lagerverwaltung/domains/Lieferung.dart';
import 'package:lagerverwaltung/pages/AddLieferung.dart';
import 'package:lagerverwaltung/provider/Lieferungen.dart';
import 'package:lagerverwaltung/widgets/MyDrawer.dart';
import 'package:provider/provider.dart';

class LieferungPage extends StatefulWidget {
  static const route = '/lieferungen';
  Lager lager;

  LieferungPage(this.lager, {Key? key}) : super(key: key);

  @override
  State<LieferungPage> createState() => _LieferungPageState();
}

class _LieferungPageState extends State<LieferungPage> {
  @override
  Widget build(BuildContext context) {
    final lieferungen = Provider.of<Lieferungen>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Lieferungen      ' +
              widget.lager.fuellstand.toString() +
              '/' +
              widget.lager.kapazitaet.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddLieferung(widget.lager)));
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.lager.lieferungen == null
                ? 0
                : widget.lager.lieferungen!.length,
            itemBuilder: (_, index) {
              final item = widget.lager.lieferungen![index];
              return Dismissible(
                key: Key(item.artikel),
                onDismissed: (direction) {
                  setState(() {
                    int fillLevel = widget.lager.fuellstand -
                        widget.lager.lieferungen![index].anzahl;
                    lieferungen.deleteLager(
                        widget.lager.id!, widget.lager.lieferungen![index].id!);
                    lieferungen.updateFillLevel(fillLevel, widget.lager.id!);
                    widget.lager.fuellstand = fillLevel;
                    widget.lager.lieferungen!.removeAt(index);
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Removed')));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(widget.lager.lieferungen![index].artikel),
                  trailing:
                      Text(widget.lager.lieferungen![index].anzahl.toString()),
                ),
              );
            }));
  }
}
