
class PermissaoPessoa {
  int idPessoa;
  int idPermissao;
  DateTime dataCriacao;
  DateTime dataAtualizacao;

  PermissaoPessoa({
    required this.idPessoa,
    required this.idPermissao,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });


  Map<String, dynamic> toMap() {
    return {
      'idPessoa': idPessoa,
      'idPermissao': idPermissao,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataAtualizacao': dataAtualizacao.millisecondsSinceEpoch,
    };
  }


  static PermissaoPessoa fromMap(Map<String, dynamic> map) {
    return PermissaoPessoa(
      idPessoa: map['idPessoa'],
      idPermissao: map['idPermissao'],
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao']),
      dataAtualizacao:
          DateTime.fromMillisecondsSinceEpoch(map['dataAtualizacao']),
    );
  }
}
