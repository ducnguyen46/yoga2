import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/category.dart';

part 'liked_exercise_state.dart';
part 'liked_exercise_cubit.freezed.dart';

class LikedExerciseCubit extends Cubit<LikedExerciseState> {
  LikedExerciseCubit(this._appRepository) : super(LikedExerciseState());

  final AppRepository _appRepository;

  void getLikedCategories() async {
    emit(state.copyWith(status: LikedExerciseStatus.loading));
    final categories = await _appRepository.getListCategoryMarked();
    emit(state.copyWith(
      status: LikedExerciseStatus.loaded,
      categories: categories,
    ));
  }

  void updateAfterLikeCategory() async {
    final categories = await _appRepository.getListCategoryMarked();
    emit(state.copyWith(
      categories: categories,
    ));
  }
}
