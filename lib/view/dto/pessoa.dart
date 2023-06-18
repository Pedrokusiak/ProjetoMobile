
import 'package:path/path.dart';


class Pessoa {
  int id;
  String nome;
  String cpf;
  String email;
  String senha;
  String endereco;
  String cep;
  DateTime dataCriacao;
  DateTime dataAtualizacao;

  Pessoa({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.senha,
    required this.endereco,
    required this.cep,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'senha': senha,
      'endereco': endereco,
      'cep': cep,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataAtualizacao': dataAtualizacao.millisecondsSinceEpoch,
    };
  }


  static Pessoa fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: map['id'],
      nome: map['nome'],
      cpf: map['cpf'],
      email: map['email'],
      senha: map['senha'],
      endereco: map['endereco'],
      cep: map['cep'],
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao']),
      dataAtualizacao:
          DateTime.fromMillisecondsSinceEpoch(map['dataAtualizacao']),
    );
  }
}
