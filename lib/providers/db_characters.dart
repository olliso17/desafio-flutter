import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_flutter/models/people_constructor.dart';

class DBPeopleProvider {
  static Database _database;
  static final DBPeopleProvider db = DBPeopleProvider._();

  DBPeopleProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'characters.db');
    return await openDatabase(
      path,
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE people('
            'id INTEGER PRIMARY KEY,'
            'name TEXT,'
            'gender TEXT,'
            'hair_color TEXT,'
            'skin_color TEXT,'
            'eye_color TEXT,'
            'birth_year TEXT,'
            'height INTEGER,'
            'mass FLOAT,'
            'homeworld TEXT,'
            'films TEXT,'
            'species TEXT,'
            'vehicles TEXT'
            ')');
      },
    );
  }

  createPeopleConstructor(PeopleConstructor newPeopleConstructor) async {
    final db = await database;
    final res = await db.insert('people', newPeopleConstructor.toJson());
    return res;
  }

  // Delete all employees
  Future<int> deleteAllPeopleConstructor() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM people');

    return res;
  }

  Future<List<PeopleConstructor>> getAllPeopleConstructor() async {
    final db = await database;
    final List<Map<String, dynamic>> res = await db.query("people");
    List<PeopleConstructor> list = [];
    if (res.isNotEmpty) {
      for (Map<String, dynamic> item in res) {
        list.add(PeopleConstructor.fromDB(item));
        print('oi');
      }
    }
    // List<PeopleConstructor> list = res.isNotEmpty
    //     ? res.map((c) => PeopleConstructor.fromDB(c)).toList()
    //     : [];

    return list;
  }
}
