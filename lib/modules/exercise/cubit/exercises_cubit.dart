import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/category.dart';
import 'package:yoga/models/exercise.dart';

part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  final AppRepository _appRepository;

  ExercisesCubit(this._appRepository) : super(ExercisesState());

  void getInitialValues(Category category) async {
    emit(state.copyWith(status: ExerciesStatus.loading));
    final isMarkedCategory =
        await _appRepository.categoryMarked(category.namefit);
    final exercies = await _getExerciesByCategory(category);
    emit(state.copyWith(
      status: ExerciesStatus.loaded,
      isMarkedCategory: isMarkedCategory,
      exercies: exercies,
    ));
  }

  void markedUnmarkedCategory(
    Category category,
  ) async {
    await _appRepository.markCategory(
      category.namefit,
      !state.isMarkedCategory,
    );
    emit(state.copyWith(isMarkedCategory: !state.isMarkedCategory));
  }

  Future<List<Exercise>> _getExerciesByCategory(Category category) {
    return _appRepository.getExerciseFromCategory(category);
  }
}
