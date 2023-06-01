import 'package:sqflite/sqflite.dart';

import '../../../view/dto/trabalho.dart';
import '../../../view/interface/trabalho_interface_dao.dart';
import '../conexao.dart'; //importanção

class TrabalhoDAOSQLite implements TrabalhoInterfaceDAO {
  @override
  Future<Trabalho> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('Trabalho', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterTrabalho(resultado);
  }

  @override
  Future<List<Trabalho>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Trabalho> lista =
        (await db.query('trabalho')).map<Trabalho>(converterTrabalho).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM trabalho WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Trabalho> salvar(Trabalho trabalho) async {
    Database db = await Conexao.criar();
    String sql;
    if (trabalho.id == null) {
      sql = 'INSERT INTO trabalho (nome, endereco,url_avatar) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql, [trabalho.nome, trabalho.endereco]);
      trabalho = Trabalho(
        id: id,
        nome: trabalho.nome,
        endereco: trabalho.endereco,
      );
    } else {
      sql =
          'UPDATE trabalho SET nome = ?, endereco = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql, [trabalho.nome, trabalho.endereco, trabalho.id]);
    }
    return trabalho;
  }

  Trabalho converterTrabalho(Map<dynamic, dynamic> resultado) {
    return Trabalho(
        id: resultado['id'],
        nome: resultado['nome'],
        endereco: resultado['endereco']);
  }
}
