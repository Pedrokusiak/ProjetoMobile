import 'package:flutter/material.dart';

class ControleSalario extends StatefulWidget {
  @override
  _ControleSalarioState createState() => _ControleSalarioState();
}

class _ControleSalarioState extends State<ControleSalario> {
  TextEditingController salarioBrutoController = TextEditingController();
  TextEditingController inssController = TextEditingController();
  TextEditingController impostoRendaController = TextEditingController();
  TextEditingController descontosController = TextEditingController();
  TextEditingController salarioLiquidoController = TextEditingController();

  double salarioBruto = 0;
  double inss = 0;
  double impostoRenda = 0;
  double descontos = 0;
  double salarioLiquido = 0;

  @override
  void initState() {
    super.initState();
    salarioBrutoController.text = "1000";
    inssController.text = "100";
    impostoRendaController.text = "100";
    descontosController.text = "100";
    salarioLiquidoController.text = "00";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle de Salário"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: salarioBrutoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Salário Bruto",
              ),
            ),
            TextField(
              controller: inssController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "INSS",
              ),
            ),
            TextField(
              controller: impostoRendaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Imposto de Renda",
              ),
            ),
            TextField(
              controller: descontosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Descontos",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Salário Líquido: R\$ ${salarioLiquidoController.text}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text("Calcular Salário Líquido"),
            ),
          ],
        ),
      ),
    );
  }
}
