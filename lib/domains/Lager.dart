import 'package:flutter/foundation.dart';

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
            kapazitaet: json['capacity'],
            fuellstand: json['fillLevel'],
            location: json['location'],
            lieferungen: json['Lieferungen'] == null
                ? []
                : json['Lieferungen']
                    .entries
                    .map<Lieferung>(
                        (entry) => Lieferung.fromJson(entry.value, entry.key))
                    .toList(),
  );


  Map<String, dynamic> toJson() {
    return {
      'capacity': kapazitaet,
      'fillLevel': fuellstand,
      'location': location,
      'Lieferung': lieferungen
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lager &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          kapazitaet == other.kapazitaet &&
          fuellstand == other.fuellstand &&
          location == other.location &&
          listEquals(lieferungen, other.lieferungen);

  @override
  int get hashCode =>
      id.hashCode ^
      kapazitaet.hashCode ^
      fuellstand.hashCode ^
      location.hashCode ^
      lieferungen.hashCode;
}
