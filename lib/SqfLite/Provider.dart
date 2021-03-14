import 'package:sqflite/sqflite.dart';

class Provider{
  Database _database;

  Future open(String path) async {
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table Amlak ( 
              id integer primary key autoincrement, 
              phone text not null,
              metr integer not null)
              ''');
        });
  }
}
