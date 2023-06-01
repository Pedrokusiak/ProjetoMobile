import 'package:flutter/material.dart';
import 'package:projeto03/widget/Home.dart';
import 'package:projeto03/widget/recuperarSenha.dart';
import 'package:projeto03/widget/rotas.dart';
import 'cadastro.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 2),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecuperarSenha(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 08),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.popAndPushNamed(context, Rotas.home);
              },
            ),
            const SizedBox(height: 08),
            ElevatedButton(
              child: const Text('Local'),
              onPressed: () {
                Navigator.popAndPushNamed(context, Rotas.trabalhoLista);
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text("Cadastrar"),
              onPressed: () {
                Route rota =
                    MaterialPageRoute(builder: (context) => Cadastro());
                Navigator.pushReplacement(context, rota);
              },
            ),
          ],
        ),
      ),
    );
  }
}
