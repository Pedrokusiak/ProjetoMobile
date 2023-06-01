import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widget/calendario.dart';
import '../widget/configuracao.dart';
import '../widget/home.dart';

class Justificativa extends StatefulWidget {
  const Justificativa({Key? key}) : super(key: key);

  @override
  _JustificativaState createState() => _JustificativaState();
}

class _JustificativaState extends State<Justificativa> {
  DateTime? selectedDay;
  TextEditingController _horarioInicioController =
      TextEditingController(text: "08:00");
  TextEditingController _horarioFimController =
      TextEditingController(text: "18:00");
  TextEditingController _motivo = TextEditingController(text: "Atestado");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Justificar Ausência"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "A justificativa da ausência deve ser utilizada caso você tenha se ausentado do trabalho por atestado."),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: TableCalendar(
                                    firstDay: DateTime.utc(2023),
                                    lastDay: DateTime.utc(2099),
                                    focusedDay: selectedDay ?? DateTime.now(),
                                    selectedDayPredicate: (day) {
                                      return isSameDay(day, selectedDay!);
                                    },
                                    onDaySelected: (selectedDay, focusedDay) {
                                      setState(() {
                                        this.selectedDay = selectedDay;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 5),
                              Text("Data"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: selectedDay == null
                                ? const Text("Nenhum dia selecionado")
                                : Text(
                                    "Dia selecionado: ${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Horário Início',
                      ),
                      controller: _horarioInicioController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Horário Fim',
                      ),
                      controller: _horarioFimController,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Motivo',
                      ),
                      controller: _motivo,
                      maxLines: null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Ação a ser executada quando o botão for pressionado
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Pedido Enviado")),
                        );
                      },
                      child: const Text("Enviar"),
                    ),
                  ],
                ),
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
              onPressed: () {
                Route rota = MaterialPageRoute(builder: (context) => Home());
                Navigator.push(context, rota);
              },
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
