import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taskmanager/model/Constants.dart';
import 'package:taskmanager/model/listmodel.dart';

class DatabaseHelper {
  static final _databaseName = "todo.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  /// creating the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${MyConstants.tableTodo} (
            ${MyConstants.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${MyConstants.columnTitle} TEXT NOT NULL,
            ${MyConstants.columnType} TEXT NOT NULL,
            ${MyConstants.columnDone} INTEGER NOT NULL 
          )
    ''');
  }

  /// Insert function
  Future<ListModel> insert(ListModel todo) async {
    Database db = await instance.database;
    todo.id = await db
        .insert(MyConstants.tableTodo, todo.toMap())
        .whenComplete(() => print('insert successful'));
    return todo;
  }

  Future<int> update(ListModel todo) async {
    Database db = await instance.database;
    var io = await db.update(MyConstants.tableTodo, todo.toMap(),
        where: '${MyConstants.columnTitle} = ?',
        whereArgs: [todo.text]).whenComplete(() => print('update successful'));
    return io;
  }

  /// Reading specific item from database
  Future<ListModel> readItem(int id) async {
    Database db = await instance.database;
    List<Map> maps = await db
        .query(MyConstants.tableTodo,
            columns: [
              MyConstants.columnId,
              MyConstants.columnTitle,
              MyConstants.columnDone
            ],
            where: '${MyConstants.columnId} = ?',
            whereArgs: [id])
        .whenComplete(() => print('read successful'));

    return ListModel.fromMap(maps.first);
  }

  /// Reading all items from column
  Future<List<Map<String, dynamic>>> readAll() async {
    Database db = await instance.database;
    return await db
        .query(MyConstants.tableTodo, orderBy: "${MyConstants.columnId} DESC")
        .whenComplete(() => print('read successful'));
  }

  /// delete specific item
  Future<int> delete(String str) async {
    Database db = await instance.database;
    return await db.delete(MyConstants.tableTodo,
        where: '${MyConstants.columnTitle} = ?',
        whereArgs: [str]).whenComplete(() => print('delete successful'));
  }

  /// all clear
  Future clearTable() async {
    Database db = await instance.database;
    String path = join(await getDatabasesPath(), _databaseName);
    return deleteDatabase(path); // it delete database
    // return await db.rawQuery("DELETE FROM $table"); // it delete table
  }
}
