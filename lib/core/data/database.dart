import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yoga/models/exercise_completed.dart';
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
    //
    // __________________

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
  // Db li??n quan ?????n Category
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

  // mark category y??u th??ch ho???c un_mark category
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

  //list category marked
  Future<List<Category>> getListCategoryMarked() async {
    var db = await database;
    var listMapCategory =
        await db.query("category", where: 'mark = ?', whereArgs: [1]);

    List<Category> categories =
        listMapCategory.map((json) => Category().fromJson(json)).toList();

    return categories;
  }

  //-------------------------------- * ----------------------------
  // Db li??n quan ?????n Exercise
  //
  //
  Future<List<Exercise>> getExerciseFromCategory(Category category) async {
    var db = await database;
    var listExerciseCategory = await db.query("exercise",
        where: '"namefit" = ?', whereArgs: [category.namefit]);

    List<Exercise> exercises =
        listExerciseCategory.map((json) => Exercise().fromJson(json)).toList();

    return exercises;
  }

  //-------------------------------- * ----------------------------
  // DB li??n quan ?????n Weight
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

    // ki???m tra xem ???? t???n t???i ghi c??n n???ng v??o h??m nay ch??a
    var listWeight = await db.query("weight",
        where: "date = ? AND month = ? AND year = ?",
        whereArgs: [dayInMonth, month, year]);

    // l???y ra ???????c list weight, n???u length > 0 => ???? t???n t???i
    List<Weight> listWeightAvailabe =
        listWeight.map((json) => Weight().fromJson(json)).toList();

    int result;
    // ???? t???n t???i
    if (listWeightAvailabe.length > 0) {
      int id = listWeightAvailabe[0].id;
      //update
      result = await db.update("weight", Weight().toJsonWoId(w),
          where: "id = ?", whereArgs: [id]);
    }
    // ch??a t???n t???i th?? th??m m???i v???i id auto increment
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

  //-------------------------------- * ----------------------------
  // DB li??n quan ?????n ExerciseCount
  //
  // add exercise completed
  Future<bool> addUpdateExcerciseCompleted(
      ExerciseCompleted exerciseCompleted) async {
    var db = await database;
    //if have EC with 'namefit'
    var queryECInDB = await db.query("exercise_completed",
        where: "namefit = ?", whereArgs: [exerciseCompleted.namefit]);
    List<ExerciseCompleted> listECInFB = queryECInDB
        .map((json) => ExerciseCompleted.init().fromJSON(json))
        .toList();

    if (listECInFB.isNotEmpty) {
      ExerciseCompleted eCInDB = listECInFB[0];
      ExerciseCompleted eCtoUpdate = ExerciseCompleted(
        id: eCInDB.id,
        namefit: eCInDB.namefit,
        exerciseCount: (eCInDB.exerciseCount + exerciseCompleted.exerciseCount),
        timeCount: (eCInDB.timeCount + exerciseCompleted.timeCount),
      );

      var updateEC = await db.update(
        "exercise_completed",
        ExerciseCompleted.init().toJsonWoId(eCtoUpdate),
        where: "id = ?",
        whereArgs: [eCtoUpdate.id],
      );

      return (updateEC == 1) ? true : false;
    } else {
      var insertEC = await db.insert(
        "exercise_completed",
        ExerciseCompleted.init().toJsonWoId(exerciseCompleted),
      );

      print(insertEC);
      return (insertEC == 1) ? true : false;
    }
  }

  // ?????m s??? b??i t???p c?? trong b???ng
  Future<int> countWorkoutCompleted() async {
    var db = await database;
    var queryCount = await db
        .query("exercise_completed", columns: ["COUNT(namefit) as count"]);

    // var queryCount = await db
    //     .rawQuery("SELECT COUNT(namefit) as count FROM exercise_completed");

    int count = queryCount.map((json) => json["count"]).toList()[0];

    return count;
  }

  // t??nh t???ng c??c b??i t???p ???? t???p
  Future<int> sumExerciseCompleted() async {
    var db = await database;
    var queryCount = await db.query("exercise_completed",
        columns: ["SUM(exercise_count) as exercise"]);

    int count = queryCount.map((json) => json["exercise"]).toList()[0];

    return count;
  }

  // t??nh t???ng th???i gian trong c??c b??i t???p
  Future<double> sumTimeCompleted() async {
    var db = await database;
    var queryCount = await db.query("exercise_completed",
        columns: ["SUM(time_count) as time_count"]);

    double count = queryCount.map((json) => json["time_count"]).toList()[0];

    return count;
  }
}
