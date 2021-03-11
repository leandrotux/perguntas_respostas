import 'package:flutter/material.dart';
import 'package:projeto_perguntas/question.dart';
import 'package:projeto_perguntas/Answer.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;

  final _questions = const [
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

  void _replay() {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
      });
    }
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        hasSelectedQuestion ? _questions[_selectedQuestion]["answers"] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: hasSelectedQuestion
            ? Column(
                children: <Widget>[
                  Question(_questions[_selectedQuestion]["text"]),
                  ...answers.map((t) => Answer(t, _replay)).toList(),
                ],
              )
            : Center(
                child: Text(
                  "Parabéns!!!",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
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
