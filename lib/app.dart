import 'package:flutter/material.dart';
import 'package:projeto03/widget/cadastro.dart';
import 'package:projeto03/widget/cadastroFuncionario.dart';
import 'package:projeto03/widget/cadastroLocal.dart';
import 'package:projeto03/widget/controleHoras.dart';
import 'package:projeto03/widget/controleSalario.dart';
import 'package:projeto03/widget/login.dart';
import 'package:projeto03/widget/ponto.dart';
import 'package:projeto03/widget/recuperarSenha.dart';
import 'package:projeto03/widget/rotas.dart';
import 'package:projeto03/view/listas/trabalhoLista.dart';

import 'widget/home.dart';

class App extends StatelessWidget {
  //App possui um método abstrato
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marcador de Ponto",
      routes: {
        '/': (context) => Ponto(),
        Rotas.home: (context) => Home(),
        Rotas.cadastro: (context) => Cadastro(),
        Rotas.login: (context) => Login(),
        Rotas.cadastroFuncionario: (context) => CadastroFuncionario(),
        Rotas.cadastroLocal: (context) => CadastroLocal(),
        Rotas.controleHoras: (context) => ControleHoras(),
        Rotas.controleSalario: (context) => ControleSalario(),
        Rotas.recuperarSenha: (context) => RecuperarSenha(),
        Rotas.trabalhoLista: (context) => TrabalhoLista(),
      },
    );
  }
}
