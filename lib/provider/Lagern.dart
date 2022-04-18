import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lagerverwaltung/domains/Lager.dart';
import 'package:http/http.dart' as http;

class Lagern with ChangeNotifier {
  var _values = <Lager>[];

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
      print(data);
      final serverValues = data.entries
          .map<Lager>((entry) => Lager.fromJson(entry.value, entry.key))
          .toList();
      print(serverValues+'test');

      if (!listEquals(_values, serverValues)) {
        _values = serverValues;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> addLager() async {}
}
