import 'package:flutter/material.dart';
import 'package:lagerverwaltung/domains/Lager.dart';
import 'package:lagerverwaltung/provider/Artikel.dart';
import 'package:lagerverwaltung/provider/Lieferungen.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'LagerPage.dart';

class AddLieferung extends StatefulWidget {
  Lager lager;

  AddLieferung(this.lager, {Key? key}) : super(key: key);

  @override
  State<AddLieferung> createState() => _AddLieferungState();
}

class _AddLieferungState extends State<AddLieferung> {
  final _formKey = GlobalKey<FormState>();
  String selectOption = '';

  final TextEditingController _anzahlController = new TextEditingController();

  List<DropdownMenuItem<String>> buildDropDownItems(List<String> artikeln) {
    final result = <DropdownMenuItem<String>>[];
    for (final option in artikeln) {
      final item = DropdownMenuItem(
        child: Text(option),
        value: option,
      );
      result.add(item);
    }
    return result;
  }

  @override
  void initState() {
    final artikel = Provider.of<Artikel>(context, listen: false);
    selectOption = artikel.all[0];
  }

  @override
  Widget build(BuildContext context) {
    final artikel = Provider.of<Artikel>(context, listen: false);
    final lieferungen = Provider.of<Lieferungen>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Neue Lieferung'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            DropdownButton(
                items: buildDropDownItems(artikel.all),
                value: selectOption,
                onChanged: (selected) {
                  setState(() {
                    selectOption = selected as String;
                  });
                }),
            TextFormField(
              controller: _anzahlController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Anzahl'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            FloatingActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  int fillLevel = widget.lager.fuellstand +
                      int.parse(_anzahlController.text);
                  if (fillLevel > widget.lager.kapazitaet) {
                    return _alert(context);
                }
                lieferungen.addLieferung(int.parse(_anzahlController.text), selectOption, widget.lager.id!);
                lieferungen.updateFillLevel(fillLevel, widget.lager.id!);
                Navigator.of(context).popAndPushNamed(LagerPage.route);
              }
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  _alert(context){
    Alert(
      context: context,
      title: 'Es ist nicht genug Platz im Lager',
    ).show();
  }
}
