import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lagerverwaltung/domains/Lieferung.dart';
import 'package:http/http.dart' as http;

class Lieferungen with ChangeNotifier {
  var _values = <Lieferung>[];

  static const baseURL =
      'https://lagerverwaltung-97f37-default-rtdb.europe-west1.firebasedatabase.app/';

  List<Lieferung> get all {
    return [..._values];
  }

  Future<void> addLieferung(int anzahl, String artikel, String lagerId) async {
    final url = Uri.parse('$baseURL/Lager/$lagerId/Lieferungen.json');
    final lieferung = Lieferung(anzahl: anzahl, artikel: artikel);
    final body = jsonEncode(lieferung.toJson());
    try {
      final response = await http.post(url, body: body);
      lieferung.id = jsonDecode(response.body)['name'];
      _values.add(lieferung);
      notifyListeners();
    } catch (error) {}
  }

  Future<void> updateFillLevel(int anzahl, String lagerId) async {
    final url = Uri.parse('$baseURL/Lager/$lagerId.json');
    final body = jsonEncode({'fillLevel': anzahl});
    try {
      final response = await http.patch(url, body: body);
      jsonEncode(response.body);
      notifyListeners();
    } catch (error) {}
  }

  void deleteLager(String lagerId, String lieferungId) async {
    final url = Uri.parse('$baseURL/Lager/$lagerId/Lieferungen/$lieferungId.json');
    try{
      await http.delete(url);
      notifyListeners();
    }catch (error) {
    }
  }
}
