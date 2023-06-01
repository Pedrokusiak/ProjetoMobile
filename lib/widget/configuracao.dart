import 'package:flutter/material.dart';
import 'package:projeto03/widget/cadastroLocal.dart';
import 'package:projeto03/widget/controleHoras.dart';
import 'package:projeto03/widget/controleSalario.dart';
import 'package:projeto03/widget/home.dart';
import 'package:projeto03/widget/justificativa.dart';
import 'package:projeto03/widget/local.dart';
import 'package:projeto03/widget/perfil.dart';

class Configuracoes extends StatelessWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.location_city),
                label: Text("Locais Cadastrados"),
                onPressed: () {
                  Route rota = MaterialPageRoute(builder: (context) => Local());
                  Navigator.push(context, rota);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.person),
                label: Text("Perfil"),
                onPressed: () {
                  Route rota =
                      MaterialPageRoute(builder: (context) => Perfil());
                  Navigator.push(context, rota);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.comment),
                label: Text("Alterar Senha"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.attach_money),
                label: Text("Salario"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ControleSalario()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.comment),
                label: Text("Justificar Ausência"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Justificativa()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.comment),
                label: Text("Minhas Solicitações"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.settings),
                label: Text("Configurações"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Route rota = MaterialPageRoute(builder: (context) => Home());
                Navigator.pop(context, rota);
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
