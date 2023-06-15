import 'package:sqflite/sqflite.dart';

import '../../../view/dto/solicitacao.dart';
import '../../../view/interface/solicitacao_interface_dao.dart';
import '../conexao.dart'; //importanção

class SolicitacaoDAOSQLite implements SolicitacaoInterfaceDAO {
  @override
  Future<Solicitacao> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('Solicitacao', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterSolicitacao(resultado);
  }

  @override
  Future<List<Solicitacao>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Solicitacao> lista =
        (await db.query('solicitacao')).map<Solicitacao>(converterSolicitacao).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM solicitacao WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Solicitacao> salvar(Solicitacao solicitacao) async {
    Database db = await Conexao.criar();
    String sql;
    if (solicitacao.id == null) {
      sql = 'INSERT INTO solicitacao (motivo, descricao, dataOcorrencia) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql, [solicitacao.motivo, solicitacao.descricao, solicitacao.dataOcorrencia]);
      solicitacao = Solicitacao(
        id: id,
        motivo: solicitacao.motivo,
        descricao: solicitacao.descricao,
        dataOcorrencia: solicitacao.dataOcorrencia
      );
    } else {
      sql =
          'UPDATE solicitacao SET motivo = ?, descricao = ?, dataOcorrencia= ? WHERE id = ?';
      db.rawUpdate(sql, [
        solicitacao.motivo,
        solicitacao.descricao,
        solicitacao.dataOcorrencia, 
        solicitacao.id]);
    }
    return solicitacao;
  }

  Solicitacao converterSolicitacao(Map<dynamic, dynamic> resultado) {
    return Solicitacao(
        id: resultado['id'],
        motivo: resultado['motivo'],
        descricao: resultado['descricao'],
        dataOcorrencia: resultado['dataOcorrencia']);
  }
}
