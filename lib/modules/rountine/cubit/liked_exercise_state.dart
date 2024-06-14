part of 'liked_exercise_cubit.dart';

enum LikedExerciseStatus { initial, loading, loaded }

@freezed
class LikedExerciseState with _$LikedExerciseState {
  const factory LikedExerciseState({
    @Default(LikedExerciseStatus.initial) LikedExerciseStatus status,
    @Default(<Category>[]) List<Category> categories,
  }) = _LikedExerciseState;
}
