part of 'exercise_cubit.dart';

enum ExerciseStatus { running, completedExcercise, savingData, savedData }

@freezed
class ExerciseState with _$ExerciseState {
  const factory ExerciseState({
    @Default(ExerciseStatus.running) ExerciseStatus status,
    @Default(30) int tick,
    @Default(0) int countCompletedExcercise,
  }) = _Exercise;
}
