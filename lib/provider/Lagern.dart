import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lagerverwaltung/domains/Lager.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class Lagern with ChangeNotifier {
  var _values = <Lager>[];
  late BuildContext context;

  static const baseUrl =
      'https://lagerverwaltung-97f37-default-rtdb.europe-west1.firebasedatabase.app/';

  List<Lager> get all {
    return [..._values];
  }

  Future<void> loadLager() async {
    final url = Uri.parse('$baseUrl/Lager.json');
    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      final serverValues = data.entries
          .map<Lager>((entry) => Lager.fromJson(entry.value, entry.key))
          .toList();
      if (!listEquals(_values, serverValues)) {
        _values = serverValues;
        notifyListeners();
      }
    } catch (error) {
       final snackBar = SnackBar(
        content: const Text('Verbindung Fehlgeschlagen'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> addLager(int kapazitaet, String location) async {
    final url = Uri.parse('$baseUrl/Lager.json');
    final lager = Lager(
        fuellstand: 0, kapazitaet: kapazitaet, location: location);
    final body = jsonEncode(lager.toJson());
    try {
      final response = await http.post(url, body: body);
      lager.id = jsonDecode(response.body)['name'];
      _values.add(lager);
      notifyListeners();
    } catch (error) {}
  }

}

