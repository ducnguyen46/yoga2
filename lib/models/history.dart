class History {
  int id;
  String date;
  double calor;
  int time;
  int exerciseCount;

  History({
    this.id,
    this.date,
    this.calor,
    this.time,
    this.exerciseCount,
  });

  History fromJson(Map<String, dynamic> json) {
    return History(
      id: json["id"] as int,
      date: json["date"] as String,
      calor: json["calor"] as double,
      time: json["time"] as int,
      exerciseCount: json["exercise_count"] as int,
    );
  }
}
