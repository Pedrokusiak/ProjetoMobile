import 'package:sqflite/sqflite.dart';

import '../../../view/dto/cidade.dart';
import '../../../view/dto/trabalho.dart';
import '../../../view/interface/trabalho_interface_dao.dart';
import '../conexao.dart';
import 'CidadeDAOSQLite.dart'; //importanção

class TrabalhoDAOSQLite implements TrabalhoInterfaceDAO {
  @override
  Future<Trabalho> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('Trabalho', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converter(resultado);
  }

  @override
  Future<List<Trabalho>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic, dynamic>> resultadoBD = await db.query('trabalho');
    List<Trabalho> lista = [];
    for (var registro in resultadoBD) {
      var trabalho = await converter(registro);
      lista.add(trabalho);
    }
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
          cidade: trabalho.cidade);
    } else {
      sql =
          'UPDATE trabalho SET nome = ?, endereco = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql, [trabalho.nome, trabalho.endereco, trabalho.id]);
    }
    return trabalho;
  }

  Future<Trabalho> converter(Map<dynamic, dynamic> resultado) async {
    Cidade cidade = await CidadeDAOSQLite().consultar(resultado['cidade_id']);
    return Trabalho(
        id: resultado['id'],
        nome: resultado['nome'],
        endereco: resultado['endereco'],
        cidade: cidade);
  }
}
