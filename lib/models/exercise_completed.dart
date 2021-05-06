import 'package:flutter/material.dart';

class ExerciseCompleted {
  int id;
  String namefit;
  int exerciseCount;
  double timeCount;

  ExerciseCompleted({
    this.id,
    @required this.namefit,
    @required this.exerciseCount,
    @required this.timeCount,
  });

  ExerciseCompleted.init();

  ExerciseCompleted fromJSON(Map<String, dynamic> json) {
    return ExerciseCompleted(
      id: json["id"],
      namefit: json["namefit"],
      exerciseCount: json["exercise_count"],
      timeCount: json["time_count"],
    );
  }

  Map<String, dynamic> toJsonWoId(ExerciseCompleted excerciseCompleted) {
    return <String, dynamic>{
      "namefit": excerciseCompleted.namefit,
      "exercise_count": excerciseCompleted.exerciseCount,
      "time_count": excerciseCompleted.timeCount,
    };
  }
}
