import 'package:flutter/material.dart';
import 'package:projeto03/widget/cadastro.dart';
import 'package:projeto03/widget/cadastroFuncionario.dart';
import 'package:projeto03/widget/configuracao.dart';
import 'package:projeto03/widget/home.dart';

class Local extends StatelessWidget {
  const Local({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locais Cadastrados"),
      ),
      body: Row(
        children: [
          ElevatedButton(
            child: const Text("Cadastro de Funcionario"),
            onPressed: () {
              Route rota = MaterialPageRoute(
                  builder: (context) => CadastroFuncionario());
              Navigator.push(context, rota);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Route rota = MaterialPageRoute(builder: (context) => Home());
                Navigator.push(context, rota);
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Route rota =
                    MaterialPageRoute(builder: (context) => Configuracoes());
                Navigator.push(context, rota);
              },
            ),
          ],
        ),
      ),
    );
  }
}
