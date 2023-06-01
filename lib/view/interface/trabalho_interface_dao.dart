import '../dto/trabalho.dart';

abstract class TrabalhoInterfaceDAO {
  Future<Trabalho> salvar(Trabalho trabalho);
  Future<bool> excluir(dynamic id);
  Future<Trabalho> consultar(int id);
  Future<List<Trabalho>> consultarTodos();
}
