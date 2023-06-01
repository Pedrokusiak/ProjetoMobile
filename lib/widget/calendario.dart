import 'package:flutter/material.dart';
import 'Home.dart';

class Calendario extends StatelessWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario"),
      ),
      body: ElevatedButton(
        child: const Text("Voltar para Home"),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Home());
          Navigator.push(context, rota);
        },
      ),
    );
  }
}
