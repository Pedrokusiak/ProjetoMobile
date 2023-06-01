import 'package:flutter/material.dart';
import 'package:projeto03/widget/rotas.dart';
import 'cadastro.dart';
import 'login.dart';

class Ponto extends StatelessWidget {
  const Ponto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introdução')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Bem-vindo ao Ponto",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Future.delayed(const Duration(seconds: 4), () {
                Navigator.pushReplacementNamed(context, Rotas.login);
              });
            },
            child: const Text('Entrar'),
          ),
        ]),
      ),
    );
  }
}
