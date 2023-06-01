import 'package:flutter/material.dart';
import 'package:projeto03/widget/cadastroFuncionario.dart';
import 'package:projeto03/widget/cadastroLocal.dart';
import 'package:projeto03/widget/calendario.dart';
import 'package:projeto03/widget/configuracao.dart';
import 'package:projeto03/widget/controleHoras.dart';
import 'package:projeto03/widget/controleSalario.dart';
import 'package:projeto03/widget/login.dart';
import 'package:projeto03/widget/rotas.dart';
import 'package:projeto03/widget/perfil.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Route rota = MaterialPageRoute(builder: (context) => Perfil());
              Navigator.push(context, rota);
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Bom dia",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "Pedro Kusiak",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                TimeOfDay.now().format(context),
                style: TextStyle(fontSize: 48),
              ),
              const SizedBox(height: 20),
              Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Marcar Ponto"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Route rota = MaterialPageRoute(
                      builder: (context) => UltimasMarcacoes());
                  Navigator.push(context, rota);
                },
                child: const Text("Últimas Marcações"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () {
                Route rota =
                    MaterialPageRoute(builder: (context) => Calendario());
                Navigator.push(context, rota);
              },
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

class UltimasMarcacoes extends StatelessWidget {
  const UltimasMarcacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Últimas Marcações"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          final data = DateFormat('dd/MM/yyyy').format(DateTime.now());
          final horarioEntrada = '7:59 AM';
          final horarioSaida = '5:59 PM';

          return ListTile(
            title: Text('Data: $data'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Horário de Entrada: $horarioEntrada'),
                Text('Horário de Saída: $horarioSaida'),
              ],
            ),
          );
        },
      ),
    );
  }
}
