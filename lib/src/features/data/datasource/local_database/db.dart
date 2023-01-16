import 'dart:io';

import 'package:dev_post/src/core/constants/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static const databaseVersion = 2;
  // static const columnAutoId = 'id_auto';
  static const columnId = 'id';
  static const columnselfText = 'selftext';
  static const columnTitle = 'title';
  static const columnUps = 'ups';
  static const columnAuthor = 'author';
  static const columnThumbnail = 'thumbnail';
  static const columnCreatedUtc = 'created_utc';

  DB._instance();

  static final DB db = DB._instance();
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = directory.path + DataBase.databaseName;

    var db = await openDatabase(
      databasePath,
      version: databaseVersion,
      onCreate: _onCreate,
    );
    return db;
  }

  Future<void> _onCreate(Database db, int newVersion) async {
    await db.execute(
      '''
          CREATE TABLE ${DataBase.databaseName}(
            $columnId STRING NOT NULL,
            $columnselfText TEXT,
            $columnTitle TEXT NOT NULL,
            $columnUps INTEGER NOT NULL,
            $columnAuthor TEXT NOT NULL,
            $columnThumbnail TEXT,
            $columnCreatedUtc INTEGER NOT NULL
            )
        ''',
    );
  }

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }
}
// $columnAutoId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
