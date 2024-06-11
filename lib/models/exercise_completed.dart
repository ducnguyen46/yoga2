class ExerciseCompleted {
  int? id;
  String namefit;
  int exerciseCount;
  double timeCount;

  ExerciseCompleted({
    this.id,
    required this.namefit,
    required this.exerciseCount,
    required this.timeCount,
  });

  factory ExerciseCompleted.fromJSON(Map<String, dynamic> json) {
    return ExerciseCompleted(
      id: json["id"],
      namefit: json["namefit"],
      exerciseCount: json["exercise_count"],
      timeCount: json["time_count"],
    );
  }

  Map<String, dynamic> toJsonWoId() {
    return <String, dynamic>{
      "namefit": namefit,
      "exercise_count": exerciseCount,
      "time_count": timeCount,
    };
  }
}
