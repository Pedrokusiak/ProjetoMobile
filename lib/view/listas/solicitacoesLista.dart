import 'package:flutter/material.dart';

import '../../database/sqlite/dao/solicitacao__dao_sqlite.dart';
import '../../widget/rotas.dart';
import '../dto/solicitacao.dart';
import '../interface/solicitacao_interface_dao.dart';

class SolicitacaoLista extends StatefulWidget {
  const SolicitacaoLista({Key? key}) : super(key: key);

  @override
  State<SolicitacaoLista> createState() => _SolicitacaoListaState();
}

class _SolicitacaoListaState extends State<SolicitacaoLista> {
  SolicitacaoInterfaceDAO dao = SolicitacaoDAOSQLite();
  List<Solicitacao> listaSolicitacaos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Justificativas Solicitadas')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.home)
                .then((value) => buscarSolicitacaos())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Future<void> carregarSolicitacaos() async {
    final solicitacao = await dao.consultarTodos();
    setState(() {
      listaSolicitacaos = solicitacao ?? [];
    });
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarSolicitacaos(),
      builder: (context, AsyncSnapshot<List<Solicitacao>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null)
          return const Text('Não há solicitacoes cadastradas...');
        List<Solicitacao> listaSolicitacaos = lista.data!;
        return ListView.builder(
          itemCount: listaSolicitacaos.length,
          itemBuilder: (context, indice) {
            var solicitacao = listaSolicitacaos[indice];
            return criarItemLista(context, solicitacao);
          },
        );
      },
    );
  }

  Future<List<Solicitacao>> buscarSolicitacaos() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Solicitacao solicitacao) {
    return ItemLista(
      solicitacao: solicitacao,
      alterar: () async {
        final result = await Navigator.pushNamed(context, 'solicitacao_form',
            arguments: solicitacao);
        if (result != null) {
          setState(() {
            int index = listaSolicitacaos.indexOf(solicitacao);
            listaSolicitacaos[index] = result as Solicitacao;
          });
        }
      },
      detalhes: () {
        Navigator.pushNamed(context, 'home', arguments: solicitacao);
      },
      excluir: () async {
        await dao.excluir(solicitacao.id);
        await carregarSolicitacaos();
        if (listaSolicitacaos.isEmpty) {
          setState(() {});
        }
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Solicitacao solicitacao;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.solicitacao,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(solicitacao.motivo),
      subtitle: Text(solicitacao.dataOcorrencia),
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
