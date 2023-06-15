import '../dto/solicitacao.dart';

abstract class SolicitacaoInterfaceDAO {
  Future<Solicitacao> salvar(Solicitacao solicitacao);
  Future<bool> excluir(dynamic id);
  Future<Solicitacao> consultar(int id);
  Future<List<Solicitacao>> consultarTodos();
}
