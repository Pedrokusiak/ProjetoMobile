
class Permissao {
  int id;
  String nome;
  DateTime dataCriacao;
  DateTime dataAtualizacao;

  Permissao({
    required this.id,
    required this.nome,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataAtualizacao': dataAtualizacao.millisecondsSinceEpoch,
    };
  }

  static Permissao fromMap(Map<String, dynamic> map) {
    return Permissao(
      id: map['id'],
      nome: map['nome'],
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao']),
      dataAtualizacao:
          DateTime.fromMillisecondsSinceEpoch(map['dataAtualizacao']),
    );
  }
}
