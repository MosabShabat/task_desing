import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqldb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
      return _db;
    } else {
      return _db;
    }
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mosab.db');
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
CREATE TABLE "products"(
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL,
  "store" TEXT NOT NULL,
  "price" TEXT NOT NULL,
  "category" TEXT NOT NULL,
  "image" TEXT NOT NULL 
)
''');

    await batch.commit();
    print('onCreate ===================');
  }

  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  myDeleteDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mosab.db');
    await deleteDatabase(path);
  }

  read(String table) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object?> values, String? myWhere) async {
    Database? myDb = await db;
    int response = await myDb!.update(table, values, where: myWhere);
    return response;
  }

  delete(String table, String? myWhere) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table, where: myWhere);
    return response;
  }
}
