class Weight {
  int id;
  double weight;
  int date;
  int month;
  int year;

  Weight({
    this.id,
    this.weight,
    this.date,
    this.month,
    this.year,
  });

  Weight fromJson(Map<String, dynamic> json) {
    return Weight(
      id: json["id"] as int,
      weight: json["weight"] as double,
      date: json["date"] as int,
      month: json["month"] as int,
      year: json["year"] as int,
    );
  }

  Map<String, dynamic> toJson(Weight weight) {
    return <String, dynamic>{
      "id": weight.id,
      "weight": weight.weight,
      "date": weight.date,
      "month": weight.month,
      "year": weight.year,
    };
  }

  Map<String, dynamic> toJsonWoId(Weight weight) {
    return <String, dynamic>{
      "weight": weight.weight,
      "date": weight.date,
      "month": weight.month,
      "year": weight.year,
    };
  }
}
