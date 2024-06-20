import 'package:yoga/core/datasource/database_provider.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/category.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_completed.dart';
import 'package:yoga/models/exercise_lang.dart';
import 'package:yoga/models/weight.dart';

class AppRepositoryImp extends AppRepository {
  final DatabaseProvider _dbProvider;

  AppRepositoryImp({
    required DatabaseProvider dbProvider,
  }) : _dbProvider = dbProvider;

  @override
  Future<List<Category>> getCategoryByType(String type) {
    return _dbProvider.getCategoryByType(type);
  }

  @override
  Future<List<String>> getListCategoryType() {
    return _dbProvider.getListCategoryType();
  }

  @override
  Future<bool> categoryMarked(String namefit) {
    return _dbProvider.categoryMarked(namefit);
  }

  @override
  Future<List<Exercise>> getExerciseFromCategory(Category category) {
    return _dbProvider.getExerciseFromCategory(category);
  }

  @override
  Future<bool> markCategory(String namefit, bool mark) {
    return _dbProvider.markCategory(namefit, mark);
  }

  @override
  Future<bool> addUpdateExcerciseCompleted(
      ExerciseCompleted exerciseCompleted) {
    return _dbProvider.addUpdateExcerciseCompleted(exerciseCompleted);
  }

  @override
  Future<List<Category>> getListCategoryMarked() {
    return _dbProvider.getListCategoryMarked();
  }

  @override
  Future<List<Category>> getCategoriesCompleted() {
    return _dbProvider.getCategoriesCompleted();
  }

  @override
  Future<int?> countWorkoutCompleted() {
    return _dbProvider.countWorkoutCompleted();
  }

  @override
  Future<List<Weight>> getAllWeight() {
    return _dbProvider.getAllWeight();
  }

  @override
  Future<double> getCurrentWeight() {
    return _dbProvider.getCurrentWeight();
  }

  @override
  Future<double> getMaxWeight() {
    return _dbProvider.getMaxWeight();
  }

  @override
  Future<double> getMinWeight() {
    return _dbProvider.getMinWeight();
  }

  @override
  Future<int?> sumExerciseCompleted() {
    return _dbProvider.sumExerciseCompleted();
  }

  @override
  Future<double?> sumTimeCompleted() {
    return _dbProvider.sumTimeCompleted();
  }

  @override
  Future<bool> addWeight(double weight, DateTime date) {
    return _dbProvider.addWeight(weight, date);
  }

  @override
  Future<List<ExerciseLang>> getAllExerciseLang() {
    return _dbProvider.getAllExerciseLang();
  }
}
