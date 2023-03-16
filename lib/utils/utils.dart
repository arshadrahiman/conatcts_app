import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/models/db_model.dart';

late Database database;

openDataBase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'contactDb.db');
  database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE contactsTable (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT,phone TEXT,email TEXT,username TEXT,cmpnyname TEXT,cmpnyphrase TEXT,cmpnybs TEXT,addcity TEXT,addstreet TEXT,addsuit TEXT,website TEXT,zipcode TEXT,lat TEXT,lng TEXT)');
  });
  if (database.isOpen) {
    print('Is DataBase is Open : ${database.isOpen}');
  }
}

Future<void> insertFruit(DbUsers user) async {
  final db = await database;
  await db.insert(
    'contactsTable',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print('insertd');
}



Future<List<dynamic>> getDBData() async {
  final db = await database;

  final List<Map<String, dynamic>> maps = await db.query(
    'contactsTable',
  );
   print(maps[0]['addsuite']);
  return List.generate(maps.length, (i) {
    return DbUsers(
        email: maps[i]['email'].toString(),
        name: maps[i]['name'].toString(),
        phone: maps[i]['phone'].toString(),
        addressCity: maps[i]['addcity'].toString(),
        addressStreet: maps[i]['addstreet'].toString(),
        addressSuit: maps[i]['addsuit'].toString(),
        companyBs: maps[i]['cmpnybs'].toString(),
        companyName: maps[i]['cmpnyname'].toString(),
        companycatchPhrase: maps[i]['cmpnyphrase'].toString(),
        latitude: maps[i]['lat'].toString(),
        longitude: maps[i]['lng'].toString(),
        userName: maps[i]['username'].toString(),
        website: maps[i]['website'].toString(),
        zipcode: maps[i]['zipcode'].toString());
  });
}

Future<void> DbClear() async {
  final db = await database;
  await db.execute("delete from " 'contactsTable');
  print('Db cleared');
}
