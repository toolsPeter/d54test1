import 'dart:async';
import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class databasehelper {
  databasehelper.private();

  static final databasehelper instance = databasehelper.private();
  static final _databasename = "accountdata.db";
  static final _databaseversion = 1;
  static final _table = "account";
  static final _datatable ="data";

  Database? _database;

  Future<Database> get database async {
    if (_database == null) _database = await _intodatabse();
    return _database!;
  }

  _intodatabse() async {
    var Directory = await getApplicationDocumentsDirectory();
    var path = join(Directory.path, _databasename);
    return openDatabase(path, version: _databaseversion, onCreate: onCreate);
  }

  FutureOr onCreate(Database db, int version) async{
    await db.execute('''
    create Table $_table(
    "id"  integer primary key autoincrement,
    "nickname" Text,
    "account" Text,
    "password" Text
    )
    ''');
    await db.execute('''
    create Table $_datatable(
    "id" Integer primary key autoincrement,
    "projectname" Text,
    "username" Text,
    "password" Text,
    "URL" Text,
    "favourite" Integer,
    "date" Text,
    "accountid" Integer
    )
    ''');
  }

  Future<int> insert(String Table ,Map<String, dynamic> row) async {
    var db = await instance.database;
    return db.insert(Table, row);
  }

  Future<List<Map<String, Object?>>> query(String Table ,String account) async {
    var db = await instance.database;
    return db.query(_table,where: "account = ?",whereArgs: [account]);
  }

  Future<int> delete(String Table ,String account) async {
    var db = await instance.database;
    return db.delete(_table, where: "account=?", whereArgs: [account]);
  }

  Future<List<Map<String, Object?>>> dataquery(String Table ,String accountid) async {
    var db = await instance.database;
    return db.query(Table,where: "accountid = ?",whereArgs: [accountid]);
  }
  Future<List<Map<String, Object?>>>queryview(String Table, int id)async{
    var db = await instance.database;
    return db.query(Table,where: "id = ?",whereArgs: [id]);
  }
  Future<int> Updata(String table ,Map<String,dynamic>row)async{
    var db = await instance.database;
    var idd = row["id"];
    return db.update(table, row,where: "id = ?",whereArgs: [row]);
  }
  Future<int> updatafavourite(String id,bool favourite)async{
    var db = await instance.database;
    return db.update(_datatable,{"favourite":(favourite? 1 : 0)},where: "id = ?",whereArgs: [id]);
  }
}
