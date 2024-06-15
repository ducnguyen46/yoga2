part of 'progress_cubit.dart';

enum ProgressStatus { initial, loading, loadingWeight, loadingExercise, loaded }

@freezed
class ProgressState with _$ProgressState {
  const factory ProgressState({
    @Default(ProgressStatus.initial) ProgressStatus status,
    @Default(<Weight>[]) List<Weight> weights,
    @Default(0) double currentWeight,
    @Default(0) double maxWeight,
    @Default(0) double minWeight,
    int? countWorkoutCompleted,
    int? countExerciseCompleted,
    double? timeWorkoutCompleted,
  }) = _ProgressState;
}
