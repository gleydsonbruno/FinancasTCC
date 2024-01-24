import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE despesas (
            id INTEGER PRIMARY KEY,
            title TEXT,
            value DOUBLE,
            description TEXT,
            type TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> listar() async {
    Database db = await database;
    return await db.query('despesas');
  }

  Future<int> inserir(Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert('despesas', data);
  }

    recuperarItems() async {

    var bancoDados = await database;
    String sql = 'SELECT * FROM despesas';
    List items = await bancoDados.rawQuery(sql);
    return items;

  }

}


class TesteID {
    int? id;
    late String titulo;

    TesteID(this.id, this.titulo);

    TesteID.fromMap(Map map) {
      this.id = map['id'];
      this.titulo = map['titulo'];
    }

    Map toMap() {
      Map<String, dynamic> map = {
        'titulo': this.titulo
      };

      if (this.id != null) {
        map['id'] = this.id;
      }

      return map;

    }
  }
