import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'app.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Users (id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)');
    await db.execute(
        'CREATE TABLE Foods (id INTEGER PRIMARY KEY, food TEXT, rating REAL)');
  }

  // User related methods
  Future<int> insertUser(Map<String, dynamic> row) async {
    Database? dbClient = await db;
    return await dbClient!.insert('Users', row);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    Database? dbClient = await db;
    return await dbClient!.query('Users');
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    Database? dbClient = await db;
    List<Map<String, dynamic>> users = await dbClient!.query(
      'Users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (users.length > 0) {
      return users.first;
    } else {
      return null;
    }
  }

  // Food related methods
  Future<int> insertFood(Map<String, dynamic> row) async {
    Database? dbClient = await db;
    return await dbClient!.insert('Foods', row);
  }

  Future<List<Map<String, dynamic>>> getAllFoods() async {
    Database? dbClient = await db;
    return await dbClient!.query('Foods');
  }

  Future<int> deleteFood(int id) async {
    Database? dbClient = await db;
    return await dbClient!.delete('Foods', where: 'id = ?', whereArgs: [id]);
  }
}
