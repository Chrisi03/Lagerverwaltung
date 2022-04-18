class Lieferung {
  String? id;
  String anzahl;
  String artikel;

  Lieferung({this.id, required this.anzahl, required this.artikel});

  Lieferung.fromJson(Map<String, dynamic> json, String id)
      : this(
          id: id,
          anzahl: json['amount'],
          artikel: json['article'],
        );
}
