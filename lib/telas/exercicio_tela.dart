import 'package:app_academia/modelos/exercicio_modelo.dart';
import 'package:app_academia/modelos/sentimento_modelo.dart';
import 'package:flutter/material.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});
  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EX001",
      nome: "Remada Baixa Supinada",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "SE001",
      sentindo: "Pouca ativação hoje",
      data: "2022-12-30",
    ),
    SentimentoModelo(
      id: "SE001",
      sentindo: "Já senti alguma ativação",
      data: "2022-07-28",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          title: Text("${exercicioModelo.nome} - ${exercicioModelo.treino}")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB FOI CLICADO!");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar foto"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tirar foto"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(sentimentoAgora.sentindo),
                    subtitle: Text(sentimentoAgora.data),
                    leading: const Icon(Icons.double_arrow),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print("DELETAR ${sentimentoAgora.sentindo}");
                      },
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
