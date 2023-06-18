import 'package:flutter/material.dart';
import 'package:loja/database_helper.dart';
import 'package:loja/pessoa.dart';
import 'package:loja/permissao.dart';
import 'package:loja/permissao_pessoa.dart';

class PessoaPermissaoLista extends StatefulWidget {
  @override
  _PessoaPermissaoListaState createState() => _PessoaPermissaoListaState();
}

class _PessoaPermissaoListaState extends State<PessoaPermissaoLista> {
  List<Pessoa> pessoas = [];
  List<Permissao> permissoes = [];
  List<PermissaoPessoa> permissoesPessoas = [];

  @override
  void initState() {
    super.initState();
    loadDataFromDatabase();
  }

  Future<void> loadDataFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;

    final pessoas = await dbHelper.getPessoas();
    final permissoes = await dbHelper.getPermissoes();
    final permissoesPessoas = await dbHelper.getPermissoesPessoas();

    setState(() {
      this.pessoas = pessoas;
      this.permissoes = permissoes;
      this.permissoesPessoas = permissoesPessoas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Permissions'),
      ),
      body: ListView.builder(
        itemCount: permissoesPessoas.length,
        itemBuilder: (context, index) {
          final permissaoPessoa = permissoesPessoas[index];
          final pessoa = pessoas.firstWhere((p) => p.id == permissaoPessoa.idPessoa);
          final permissao = permissoes.firstWhere((p) => p.id == permissaoPessoa.idPermissao);

          return ListTile(
            title: Text('Person: ${pessoa.nome}'),
            subtitle: Text('Permission: ${permissao.nome}'),
          );
        },
      ),
    );
  }
}
