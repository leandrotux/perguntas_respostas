import 'package:flutter/material.dart';
import 'package:projeto_perguntas/question.dart';
import 'package:projeto_perguntas/Answer.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var selectedQuestion = 0;

  void _replay() {
    setState(() {
      selectedQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        "text": "Qual é sua cor favorita?",
        "answers": ["Preto", "Vermelho", "Verde", "Branco"],
      },
      {
        "text": "Qual o seu aninal favorito?",
        "answers": ["Coelho", "Cobra", "Elefante", "Leão"],
      },
      {
        "text": "Qual o seu instrutor favorito?",
        "answers": ["Maria", "João", "Leo", "Pedro"],
      }
    ];

    List<String> answers = questions[selectedQuestion]["answers"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[selectedQuestion]["text"]),
            ...answers.map((t) => Answer(t, _replay)).toList(),
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
