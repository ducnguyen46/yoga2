import 'package:yoga/models/category.dart';
import 'package:yoga/models/exercise.dart';
import 'package:yoga/models/exercise_completed.dart';
import 'package:yoga/models/exercise_lang.dart';
import 'package:yoga/models/weight.dart';

abstract class AppRepository {
  Future<List<String>> getListCategoryType();
  Future<List<Category>> getCategoryByType(String type);
  Future<List<Exercise>> getExerciseFromCategory(Category category);
  Future<bool> categoryMarked(String namefit);
  Future<bool> markCategory(String namefit, bool mark);
  Future<bool> addUpdateExcerciseCompleted(ExerciseCompleted exerciseCompleted);
  Future<List<Category>> getListCategoryMarked();
  Future<List<Category>> getCategoriesCompleted();
  Future<double> getCurrentWeight();
  Future<double> getMaxWeight();
  Future<double> getMinWeight();
  Future<int?> countWorkoutCompleted();
  Future<int?> sumExerciseCompleted();
  Future<double?> sumTimeCompleted();
  Future<List<Weight>> getAllWeight();
  Future<bool> addWeight(double weight, DateTime date);
  Future<List<ExerciseLang>> getAllExerciseLang();
}
