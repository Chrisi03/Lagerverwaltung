import 'package:flutter/cupertino.dart';
import 'package:lagerverwaltung/domains/Lager.dart';

class Lagern with ChangeNotifier {
  var _values = <Lager>[];

  static const baseUrl =
      'https://lagerverwaltung-97f37-default-rtdb.europe-west1.firebasedatabase.app/';

  List<Lager> get all {
    return [..._values];
  }

  Future<void> loadLager() async {}

  Future<void> addLager() async {}
}
