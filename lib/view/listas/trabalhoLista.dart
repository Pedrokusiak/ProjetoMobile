import 'package:flutter/material.dart';
import 'package:projeto03/view/dto/trabalho.dart';
import '../../database/sqlite/dao/trabalho__dao_sqlite.dart';
import '../interface/trabalho_interface_dao.dart';

import '../../widget/rotas.dart';

class TrabalhoLista extends StatefulWidget {
  const TrabalhoLista({Key? key}) : super(key: key);

  @override
  State<TrabalhoLista> createState() => _TrabalhoListaState();
}

class _TrabalhoListaState extends State<TrabalhoLista> {
  TrabalhoInterfaceDAO dao = TrabalhoDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista De Trabalhos')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.home)
                .then((value) => buscarTrabalhos())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarTrabalhos(),
      builder: (context, AsyncSnapshot<List<Trabalho>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há contatos...');
        List<Trabalho> listaContatos = lista.data!;
        return ListView.builder(
          itemCount: listaContatos.length,
          itemBuilder: (context, indice) {
            var trabalho = listaContatos[indice];
            return criarItemLista(context, trabalho);
          },
        );
      },
    );
  }

  Future<List<Trabalho>> buscarTrabalhos() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Trabalho trabalho) {
    return ItemLista(
        trabalho: trabalho,
        alterar: () {
          Navigator.pushNamed(context, Rotas.home, arguments: trabalho)
              .then((value) => buscarTrabalhos());
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.home, arguments: trabalho);
        },
        excluir: () {
          dao.excluir(trabalho.id);
          buscarTrabalhos();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Trabalho trabalho;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.trabalho,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trabalho.nome),
      subtitle: Text(trabalho.endereco),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}

class BotaoAdicionar extends StatelessWidget {
  final VoidCallback acao;
  const BotaoAdicionar({required this.acao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => acao(),
      tooltip: 'Adicionar Novo',
      child: const Icon(Icons.add),
    );
  }
}

class BarraNavegacao extends StatelessWidget {
  const BarraNavegacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }
}

class PainelBotoes extends StatelessWidget {
  final VoidCallback alterar;
  final VoidCallback excluir;
  const PainelBotoes({required this.alterar, required this.excluir, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IconButton(
            onPressed: excluir,
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
          IconButton(
            onPressed: alterar,
            icon: const Icon(Icons.edit),
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
