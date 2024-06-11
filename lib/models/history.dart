class History {
  int id;
  String date;
  double calor;
  int time;
  int exerciseCount;

  History({
    required this.id,
    required this.date,
    required this.calor,
    required this.time,
    required this.exerciseCount,
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
