import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_completed.dart';

part 'exercise_state.dart';
part 'exercise_cubit.freezed.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit(this._appRepository, this._exercises) : super(ExerciseState());

  final AppRepository _appRepository;
  final List<Exercise> _exercises;
  late Timer _timer;

  final int exerciseTime = 30; // seconds

  void startWorkout() {
    _timer = Timer.periodic(Duration(milliseconds: 0), (_) {
      _countDownCheck();
    });
  }

  Future<void> completedExcercise(ExerciseCompleted exerciseCompleted) async {
    await _appRepository.addUpdateExcerciseCompleted(exerciseCompleted);
  }

  void _countDownCheck() {
    var count = state.countCompletedExcercise;
    var isLastExercise = (count == _exercises.length - 1);

    ///
    /// Is last item?
    /// If it's last item and tick has value 1
    /// emit to completed
    /// else it's not last item and tick has value 1
    /// continue running, set tick to 30 and count + 1
    ///

    if (isLastExercise && state.tick == 1) {
      _timer.cancel();
      emit(state.copyWith(
        tick: 0,
        status: ExerciseStatus.completedExcercise,
      ));
    } else if (!isLastExercise && state.tick == 1) {
      emit(state.copyWith(
        tick: exerciseTime,
        countCompletedExcercise: state.countCompletedExcercise + 1,
      ));
    } else {
      emit(state.copyWith(
        tick: state.tick - 1,
      ));
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
