class Trabalho {
  final dynamic id;
  final String nome;
  final String endereco;


  Trabalho(
      {this.id,
      required this.nome,
      required this.endereco,});

  @override
  String toString() {
    return '''
      $id
      $nome 
      $endereco

    ''';
  }
}
