import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/category.dart';

part 'routine_exercise_state.dart';
part 'routine_exercise_cubit.freezed.dart';

class RoutineExerciseCubit extends Cubit<RoutineExerciseState> {
  RoutineExerciseCubit(this._appRepository) : super(RoutineExerciseState());

  final AppRepository _appRepository;

  void getRoutineCategories() async {
    emit(state.copyWith(status: RoutineExerciseStatus.loading));
    final categories = await _appRepository.getCategoriesCompleted();
    emit(state.copyWith(
      status: RoutineExerciseStatus.loaded,
      categories: categories,
    ));
  }

  void updateAfterCompleteCategory() async {
    final categories = await _appRepository.getCategoriesCompleted();
    emit(state.copyWith(
      categories: categories,
    ));
  }
}
