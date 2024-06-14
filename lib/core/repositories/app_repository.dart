import 'package:yoga/models/category.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_completed.dart';

abstract class AppRepository {
  Future<List<String>> getListCategoryType();
  Future<List<Category>> getCategoryByType(String type);
  Future<List<Exercise>> getExerciseFromCategory(Category category);
  Future<bool> categoryMarked(String namefit);
  Future<bool> markCategory(String namefit, bool mark);
  Future<bool> addUpdateExcerciseCompleted(ExerciseCompleted exerciseCompleted);
  Future<List<Category>> getListCategoryMarked();
  Future<List<Category>> getCategoriesCompleted();
}
