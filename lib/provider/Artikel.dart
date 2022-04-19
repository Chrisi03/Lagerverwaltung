import 'package:flutter/cupertino.dart';

class Artikel with ChangeNotifier{
  final _values = [
    'Stahl', 'Kupfer', 'Aluminium'
  ];

  List<String> get all {
    return [..._values];
  }

  void addArtikel(String input){
    _values.add(input);
    notifyListeners();
  }

  void removeArtikel(String input){
    _values.remove(input);
    notifyListeners();
  }
}