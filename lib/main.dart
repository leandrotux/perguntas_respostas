import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questoes.dart';
import 'package:projeto_perguntas/resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      perguntaSelecionada++;
    });

    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      "Qual é sua cor favorita?",
      "Qual o seu aninal favorito?",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]),
            Resposta("Resposta1"),
            Resposta("Resposta2"),
            Resposta("Resposta3"),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
