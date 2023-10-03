import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:restaurant_management/models/bill.dart';
class BillDataHelper {
  static final String dbname = 'Bill.db';
  static final int version = 1;


  static Future<Database> getDB() async {
    final dbPath = getDatabasesPath();
    return openDatabase(join(await dbPath, dbname),onCreate: (db,version) => db.execute(
      "Create table Bill(id Integer primary key autoincrement, name TEXT not null, total real not null, arrival TEXT not null, leftover TEXT not null)"
    ), version: 5);
  }

  static Future<int> AddBill(Bill bill) async{
    final db = await getDB();
    print('add completed');
    return db.insert('Bill', bill.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> Update(Bill bill) async {
    final db = await getDB();
    return await db.update("Bill", bill.toMap(),
        where: "id = ?",
        whereArgs: [bill.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> Delete(Bill bill) async {
    final db = await getDB();
    return await db.delete("Bill", where: "id = ?", whereArgs: [bill.id]);
  }


  static Future<List<Bill>> getAll() async{
    final db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('Bill',orderBy: 'id DESC');
    
    return List.generate(maps.length, (index) => Bill(id: maps[index]['id'], name: maps[index]['name'], total: maps[index]['total'], arrival: maps[index]['arrival'], leftover: maps[index]['leftover']));


  }
}  
  