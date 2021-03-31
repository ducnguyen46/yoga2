import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    //if null
    _database = await initDB();
  }

  initDB() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join('assets/db', 'fiveYoga.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
    );
  }
}
