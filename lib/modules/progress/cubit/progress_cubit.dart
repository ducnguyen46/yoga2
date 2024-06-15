import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/weight.dart';

part 'progress_state.dart';
part 'progress_cubit.freezed.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(this._appRepository) : super(ProgressState());

  final AppRepository _appRepository;

  void getInitalProgressData() async {
    emit(state.copyWith(status: ProgressStatus.loading));
    await Future.wait([
      _appRepository.getAllWeight(),
      _appRepository.getCurrentWeight(),
      _appRepository.getMaxWeight(),
      _appRepository.getMinWeight(),
      _appRepository.countWorkoutCompleted(),
      _appRepository.sumExerciseCompleted(),
      _appRepository.sumTimeCompleted(),
    ]).then((data) {
      emit(state.copyWith(
        status: ProgressStatus.loaded,
        weights: data[0] as List<Weight>,
        currentWeight: data[1] as double,
        maxWeight: data[2] as double,
        minWeight: data[3] as double,
        countWorkoutCompleted: data[4] as int?,
        countExerciseCompleted: data[5] as int?,
        timeWorkoutCompleted: data[6] as double?,
      ));
    });
  }

  void updateDataWorkoutExercise() async {
    emit(state.copyWith(status: ProgressStatus.loadingExercise));
    await Future.wait([
      _appRepository.countWorkoutCompleted(),
      _appRepository.sumExerciseCompleted(),
      _appRepository.sumTimeCompleted(),
    ]).then((data) {
      emit(state.copyWith(
        status: ProgressStatus.loaded,
        countWorkoutCompleted: data[1] as int?,
        countExerciseCompleted: data[2] as int?,
        timeWorkoutCompleted: data[3] as double?,
      ));
    });
  }

  void updateWeightData() async {
    emit(state.copyWith(status: ProgressStatus.loadingWeight));
    await Future.wait([
      _appRepository.getAllWeight(),
      _appRepository.getCurrentWeight(),
      _appRepository.getMaxWeight(),
      _appRepository.getMinWeight(),
    ]).then((data) {
      emit(state.copyWith(
        status: ProgressStatus.loaded,
        weights: data[0] as List<Weight>,
        currentWeight: data[1] as double,
        maxWeight: data[2] as double,
        minWeight: data[3] as double,
      ));
    });
  }

  Future<void> addWeight(double weight, DateTime date) async {
    emit(state.copyWith(status: ProgressStatus.loadingWeight));
    await _appRepository.addWeight(weight, date).then(
          (_) => updateWeightData(),
        );
  }
}
