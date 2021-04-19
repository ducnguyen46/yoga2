import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yoga/models/weight.dart';

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

    // //delete database if exist and make new
    // await deleteDatabase(path);

    // //make sure dir exist
    // try {
    //   await Directory(dirname(path)).create(recursive: true);
    // } catch (_) {
    //   print(_);
    // }

    // // copy database from assets
    // ByteData data =
    //     await rootBundle.load(join('assets/database', 'fiveYoga.db'));
    // List<int> bytes =
    //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // await File(path).writeAsBytes(bytes, flush: true);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        print(_);
      }

      // Copy from asset
      ByteData data =
          await rootBundle.load(join('assets/database', 'fiveYoga.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    return await openDatabase(
      path,
      version: 1,
      readOnly: false,
    );
  }

  //-------------------------------- * ----------------------------
  // Db liên quan đến Category
  //
  //
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

  // mark category yêu thích hoặc un_mark category
  Future<bool> markCategory(String namefit, bool mark) async {
    var db = await database;
    int result;

    switch (mark) {
      case true:
        result = await db.update("category", {"mark": 1},
            where: "namefit = ?", whereArgs: [namefit]);
        break;

      case false:
        result = await db.update("category", {"mark": 0},
            where: "namefit = ?", whereArgs: [namefit]);
        break;
    }
    return (result == 1) ? true : false;
  }

  Future<bool> categoryMarked(String namefit) async {
    var db = await database;
    var result = await db.query(
      "category",
      columns: ["mark"],
      where: "namefit = ?",
      whereArgs: [namefit],
    );

    var liked = result[0]["mark"];
    return (liked as int == 1) ? true : false;
  }

  //-------------------------------- * ----------------------------
  // Db liên quan đến Exercise
  //
  //
  Future<List<Exercise>> getExerciseFromCategory(Category category) async {
    var db = await database;
    var listExerciseCategory = await db.query("exercise",
        where: '"namefit" = ?', whereArgs: [category.namefit], limit: 2);

    List<Exercise> exercises =
        listExerciseCategory.map((json) => Exercise().fromJson(json)).toList();

    return exercises;
  }

  //-------------------------------- * ----------------------------
  // DB liên quan đến Weight
  //
  // get all weight DESC
  Future<List<Weight>> getAllWeight() async {
    var db = await database;
    var listWeight = await db.query(
      "weight",
      orderBy: "year DESC, month DESC, date DESC",
    );

    List<Weight> weights =
        listWeight.map((json) => Weight().fromJson(json)).toList();
    return weights;
  }

  Future<bool> addWeight(double weight, DateTime date) async {
    int dayInMonth = date.day;
    int month = date.month;
    int year = date.year;

    Weight w =
        Weight(weight: weight, date: dayInMonth, month: month, year: year);
    var db = await database;

    // kiểm tra xem đã tồn tại ghi cân nặng vào hôm nay chưa
    var listWeight = await db.query("weight",
        where: "date = ? AND month = ? AND year = ?",
        whereArgs: [dayInMonth, month, year]);

    // lấy ra được list weight, nếu length > 0 => đã tồn tại
    List<Weight> listWeightAvailabe =
        listWeight.map((json) => Weight().fromJson(json)).toList();

    int result;
    // đã tồn tại
    if (listWeightAvailabe.length > 0) {
      int id = listWeightAvailabe[0].id;
      //update
      result = await db.update("weight", Weight().toJsonWoId(w),
          where: "id = ?", whereArgs: [id]);
    }
    // chưa tồn tại thì thêm mới với id auto increment
    else {
      result = await db.insert("weight", Weight().toJsonWoId(w));
    }
    return (result == 1) ? true : false;
  }

  // max weight
  Future<double> getMaxWeight() async {
    var db = await database;

    var maxWeightQuery = await db.query(
      "weight",
      columns: ["MAX(weight) as weight"],
      distinct: true,
    );

    List<double> listWeight =
        maxWeightQuery.map((json) => json["weight"] as double).toList();
    return listWeight[0];
  }

  // min weight
  Future<double> getMinWeight() async {
    var db = await database;

    var minWeightQuery = await db.query(
      "weight",
      columns: ["MIN(weight) as weight"],
      distinct: true,
    );

    List<double> listWeight =
        minWeightQuery.map((json) => json["weight"] as double).toList();
    return listWeight[0];
  }

  // current weight
  Future<double> getCurrentWeight() async {
    var db = await database;

    var currentWeightQuery = await db.query(
      "weight",
      columns: ["weight"],
      orderBy: "year DESC, month DESC, date DESC",
      limit: 1,
    );

    List<double> listWeight =
        currentWeightQuery.map((json) => json["weight"] as double).toList();
    return listWeight[0];
  }
}
