part of 'exercises_cubit.dart';

enum ExerciesStatus { initial, loading, loaded, error }

@freezed
class ExercisesState with _$ExercisesState {
  const factory ExercisesState({
    @Default(ExerciesStatus.initial) ExerciesStatus status,
    @Default(false) bool isMarkedCategory,
    @Default(<Exercise>[]) List<Exercise> exercies,
  }) = _ExerciesState;
}
