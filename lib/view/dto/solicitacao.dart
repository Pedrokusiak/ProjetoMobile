class Solicitacao {
  final dynamic id;
  final String motivo;
  final String descricao;
  final String dataOcorrencia;

  Solicitacao({
    this.id,
    required this.motivo,
    required this.descricao,
    required this.dataOcorrencia,
  });
}
