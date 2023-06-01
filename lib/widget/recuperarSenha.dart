import 'package:flutter/material.dart';

import 'package:projeto03/widget/login.dart';
import 'package:projeto03/widget/rotas.dart';

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recuperar Senha")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Buscar'),
              onPressed: () {
                Navigator.pop(context, Rotas.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
