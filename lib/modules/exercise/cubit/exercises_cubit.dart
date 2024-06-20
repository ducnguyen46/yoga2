import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/constants/app_language.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/category.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_lang.dart';

part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  final AppRepository _appRepository;

  ExercisesCubit(this._appRepository) : super(ExercisesState());

  void getInitialValues(Category category, Locale appLocale) async {
    emit(state.copyWith(status: ExerciesStatus.loading));
    final isMarkedCategory =
        await _appRepository.categoryMarked(category.namefit);
    final exercies = await _getExerciesByCategory(category);

    if (appLocale.languageCode != appSupportedLocales.first.languageCode) {
      final exerciseLangs = await _appRepository.getAllExerciseLang();
      final newExercises = _exerciseDescriptionByLang(
        exercies,
        exerciseLangs,
        appLocale.languageCode,
      );
      emit(state.copyWith(
        status: ExerciesStatus.loaded,
        isMarkedCategory: isMarkedCategory,
        exercies: newExercises,
      ));
    } else {
      emit(state.copyWith(
        status: ExerciesStatus.loaded,
        isMarkedCategory: isMarkedCategory,
        exercies: exercies,
      ));
    }
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

  List<Exercise> _exerciseDescriptionByLang(
      List<Exercise> exercises, List<ExerciseLang> langs, String languageCode) {
    var newExercises = <Exercise>[];

    exercises.forEach((exercise) {
      var description = "";
      final exerciseLang =
          langs.firstWhere((lang) => lang.key == exercise.image);
      switch (languageCode) {
        case "pt":
          description = exerciseLang.pt;
          break;
        case "fr":
          description = exerciseLang.fr;
          break;
        case "it":
          description = exerciseLang.it;
          break;
        case "ru":
          description = exerciseLang.ru;
          break;
        default:
          description = exercise.description;
      }
      newExercises.add(Exercise(
        id: exercise.id,
        name: exercise.name,
        image: exercise.image,
        description: description,
        namefit: exercise.namefit,
      ));
    });

    return newExercises;
  }
}
