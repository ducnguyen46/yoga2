part of 'routine_exercise_cubit.dart';

enum RoutineExerciseStatus { initial, loading, loaded }

@freezed
class RoutineExerciseState with _$RoutineExerciseState {
  const factory RoutineExerciseState({
    @Default(RoutineExerciseStatus.initial) RoutineExerciseStatus status,
    @Default(<Category>[]) List<Category> categories,
  }) = _RoutineExerciseState;
}
