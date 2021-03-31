class Weight {
  int id;
  int weight;
  int date;
  int month;

  Weight({
    this.id,
    this.weight,
    this.date,
    this.month,
  });

  Weight fromJson(Map<String, dynamic> json) {
    return Weight(
      id: json["id"] as int,
      weight: json["weight"] as int,
      date: json["date"] as int,
      month: json["month"] as int,
    );
  }
}
