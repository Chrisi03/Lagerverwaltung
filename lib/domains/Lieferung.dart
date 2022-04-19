class Lieferung {
  String? id;
  int anzahl;
  String artikel;

  Lieferung({this.id, required this.anzahl, required this.artikel});

  Lieferung.fromJson(Map<String, dynamic> json, String id)
      : this(
          id: id,
          anzahl: json['amount'],
          artikel: json['article'],
        );

  Map<String, dynamic> toJson(){
    return {'amount': anzahl, 'article': artikel};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lieferung &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          anzahl == other.anzahl &&
          artikel == other.artikel;

  @override
  int get hashCode => id.hashCode ^ anzahl.hashCode ^ artikel.hashCode;
}
