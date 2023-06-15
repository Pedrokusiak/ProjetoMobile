import 'package:projeto03/view/dto/cidade.dart';

class Trabalho {
  final dynamic id;
  final String nome;
  final String endereco;
  final Cidade cidade;

  Trabalho({
    this.id,
    required this.nome,
    required this.endereco,
    required this.cidade,
  });
}
