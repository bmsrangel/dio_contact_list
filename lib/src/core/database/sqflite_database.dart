import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

@Singleton()
class SqfliteDatabase {
  @FactoryMethod(preResolve: true)
  static Future<Database> openDb() async {
    final databaseFolder = await getDatabasesPath();
    final databasePath = path.join(databaseFolder, 'contacts.sqlite');
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.rawQuery('''
          CREATE TABLE IF NOT EXISTS contacts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
              first_name TEXT NOT NULL,
              last_name TEXT NOT NULL,
              phone_number TEXT,
              email TEXT,
              avatar_url TEXT
          );
        ''');
      },
    );
    return database;
  }
}
