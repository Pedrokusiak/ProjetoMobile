
import 'package:loja/permissao.dart';
import 'package:loja/permissaoPessoa.dart';
import 'package:loja/pessoa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'my_database.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE pessoa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            cpf TEXT,
            email TEXT,
            senha TEXT,
            endereco TEXT,
            cep TEXT,
            dataCriacao INTEGER,
            dataAtualizacao INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE permissao(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            dataCriacao INTEGER,
            dataAtualizacao INTEGER
          )
        ''');


        await db.execute('''
          CREATE TABLE permissao_pessoa(
            idPessoa INTEGER,
            idPermissao INTEGER,
            dataCriacao INTEGER,
            dataAtualizacao INTEGER,
            FOREIGN KEY (idPessoa) REFERENCES pessoa(id),
            FOREIGN KEY (idPermissao) REFERENCES permissao(id)
          )
        ''');
      },
    );
  }


  Future<void> insertPessoa(Pessoa pessoa) async {
    final db = await instance.database;
    await db.insert('pessoa', pessoa.toMap());
  }

  Future<List<Pessoa>> getPessoas() async {
    final db = await instance.database;
    final maps = await db.query('pessoa');
    return List.generate(maps.length, (i) {
      return Pessoa.fromMap(maps[i]);
    });
  }

  Future<void> insertPermissao(Permissao permissao) async {
    final db = await instance.database;
    await db.insert('permissao', permissao.toMap());
  }


  Future<List<Permissao>> getPermissoes() async {
    final db = await instance.database;
    final maps = await db.query('permissao');
    return List.generate(maps.length, (i) {
      return Permissao.fromMap(maps[i]);
    });
  }

  Future<void> insertPermissaoPessoa(PermissaoPessoa permissaoPessoa) async {
    final db = await instance.database;
    await db.insert('permissao_pessoa', permissaoPessoa.toMap());
  }


  Future<List<PermissaoPessoa>> getPermissoesPessoas() async {
    final db = await instance.database;
    final maps = await db.query('permissao_pessoa');
    return List.generate(maps.length, (i) {
      return PermissaoPessoa.fromMap(maps[i]);
    });
  }
}
