

import 'dart:developer';

import 'package:sqflite/sqflite.dart';

void main(){
  LocalDatabase();
}

class LocalDatabase {

  late final Database database;

  static final LocalDatabase instance=LocalDatabase();

  Future<void> createDatabase() async {
    final databasePath = await getDatabasesPath();
    final path= '$databasePath/my_database.db';
    database= await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{
        // log('Database created at $path' );
         await db.execute(
'CREATE TABLE todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT, category TEXT NOT NULL, priority TEXT NOT NULL, status TEXT NOT NULL,createdAt INTEGER NOT NULL, deletedAt INTEGER)');
         log("Dtatbase created at $DateTime.now()");
      },
      onOpen: (db) =>log("Database created at $path")
      );
    }


}