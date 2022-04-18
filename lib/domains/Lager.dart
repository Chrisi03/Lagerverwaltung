import 'Lieferung.dart';

class Lager {
  String? id;
  int kapazitaet;
  int fuellstand;
  String location;
  List<Lieferung>? lieferungen;

  Lager(
      {this.id,
      required this.kapazitaet,
      required this.fuellstand,
      required this.location,
      this.lieferungen});

  Lager.fromJson(Map<String, dynamic> json, String id)
      : this(
            id: id,
            kapazitaet: int.parse(json['capacity']),
            fuellstand: int.parse(json['fillLevel']),
            location: json['location'],
            lieferungen: json['location'] == null
                ? []
                : json['Lieferung']
                    .entries
                    .map<Lieferung>(
                        (entry) => Lieferung.fromJson(entry.value, entry.key))
                    .toList());

  Map<String, dynamic> toJson() {
    return {
      'capacity': kapazitaet,
      'fillLevel': fuellstand,
      'location': location,
      'Lieferung': lieferungen
    };
  }
}
