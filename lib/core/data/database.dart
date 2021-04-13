import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/catagory.dart';
import '../../models/exercise.dart';

class DatabaseProvider {
  //
  DatabaseProvider.init();
  static final DatabaseProvider db = DatabaseProvider.init();
  //
  static Database _database;

  Future<Database> get database async {
    //if null - create new and !null return this
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'fiveYoga.db');

    //delete database if exist and make new
    await deleteDatabase(path);

    //make sure dir exist
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {
      print("Something wrong");
      print(_);
    }

    // copy database from assets
    ByteData data =
        await rootBundle.load(join('assets/database', 'fiveYoga.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);

    return await openDatabase(
      path,
      version: 1,
    );
  }

  //Category
  Future<List<Category>> getAllCategory() async {
    var db = await database;
    var listMapCategory = await db.query("category");
    List<Category> categories =
        listMapCategory.map((json) => Category().fromJson(json)).toList();

    return categories;
  }

  Future<List<String>> getListCategoryType() async {
    var db = await database;
    var listTypeCategory =
        await db.query("category", distinct: true, columns: ["type"]);
    List<String> types =
        listTypeCategory.map((json) => json["type"].toString()).toList();

    return types;
  }

  Future<List<Category>> getCategoryByType(String type) async {
    var db = await database;
    var listMapCategory =
        await db.query("category", where: 'type = ?', whereArgs: [type]);

    // var listMapCategory =
    //     await db.rawQuery('SELECT * FROM "category" WHERE type = "popular"');
    List<Category> categories =
        listMapCategory.map((json) => Category().fromJson(json)).toList();

    return categories;
  }

  //Exercise
  Future<List<Exercise>> getExerciseFromCategory(Category category) async {
    var db = await database;
    var listExerciseCategory = await db.query("exercise",
        where: '"namefit" = ?', whereArgs: [category.namefit], limit: 2);

    List<Exercise> exercises =
        listExerciseCategory.map((json) => Exercise().fromJson(json)).toList();

    return exercises;
  }
}
