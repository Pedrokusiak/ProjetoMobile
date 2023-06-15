import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'scriptbd.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(),
          'banco.db'); //definindo o camminho do database
      //deleteDatabase(path);                                    //caso queira apagar tudo antes, descomente esta linha
      _database = await openDatabase(
        path, // informando o caminho
        version: 1, // versão
        onCreate: (db, v) {
          criarTabelas.forEach(db.execute);
          insercoes.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}
