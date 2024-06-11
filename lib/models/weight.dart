class Weight {
  int? id;
  double weight;
  int date;
  int month;
  int year;

  Weight({
    this.id,
    required this.weight,
    required this.date,
    required this.month,
    required this.year,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      id: json["id"] as int,
      weight: json["weight"] as double,
      date: json["date"] as int,
      month: json["month"] as int,
      year: json["year"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "weight": weight,
      "date": date,
      "month": month,
      "year": year,
    };
  }

  Map<String, dynamic> toJsonWoId() {
    return <String, dynamic>{
      "weight": weight,
      "date": date,
      "month": month,
      "year": year,
    };
  }
}
