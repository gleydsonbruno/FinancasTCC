import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();
  Database? _database;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  DatabaseHelper._internal() {
    initDatabase();
  }

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

        await db.execute('''
          CREATE TABLE entradas (
            id INTEGER PRIMARY KEY,
            title TEXT,
            value DOUBLE,
            description TEXT,
            type TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE saldo (
            id INTEGER PRIMARY KEY,
            saldo DOUBLE
          )
        ''');
      },
    );
  }


  //Quando implementar isso, remover esse comentário vvvvvv
  Future<double> obterSaldoUsuario() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('saldo_usuario');
    if (result.isNotEmpty) {
      return result.first['saldo'];
    }
    return 0;
  }

  Future<List<Map<String, dynamic>>> listar() async {
    Database db = await database;
    return await db.query('despesas');
  }

  Future<int> inserir(TesteID data) async {
    Database db = await database;
    int resultado = await db.insert('despesas', data.toMap());

    List<Map<String, dynamic>> result = await db.query('despesas');
    result.forEach((row) {
      print(row);
    });
    return resultado;
  }

  listarDespesas() async {
    var bancoDados = await database;
    String sql = 'SELECT * FROM despesas';
    List items = await bancoDados.rawQuery(sql);
    return items;
  }

  Future<int> removerDespesa(int id) async {
    var bancoDados = await database;
    return await bancoDados.delete(
      'despesas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}

class TesteID {
  int? id;
  late String title;
  late double value;
  late String description;
  late String? type;

  TesteID(this.id, this.title, this.value, this.description, this.type);

  TesteID.fromMap(Map map) {
    this.id = map['id'];
    this.title = map['title'];
    this.value = map['value'];
    this.description = map['description'];
    this.type = map['type'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'title': this.title,
      'value': this.value,
      'description': this.description,
      'type': this.type,
    };

    if (this.id != null) {
      map['id'] = this.id;
    }

    return map;
  }
}

class Saldo {
  int? id;
  late double saldo;

  Saldo(this.saldo, this.id);

  Saldo.fromMap(Map map) {
    this.saldo = map['saldo'];
    this.id = map['id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'saldo': this.saldo,
    };
    if (this.id != null) {
      map['id'] = this.id;
    }

    return map;
  }
}
