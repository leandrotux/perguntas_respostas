import 'package:flutter/material.dart';
import './Result.dart';
import './Questions.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _scoreAll = 0;
  final _questions = const [
    {
      "text": "Qual é sua cor favorita?",
      "answers": [
        {"text": "Preto", "score": 10},
        {"text": "Vermelho", "score": 8},
        {"text": "Verde", "score": 5},
        {"text": "Branco", "score": 1}
      ],
    },
    {
      "text": "Qual o seu aninal favorito?",
      "answers": [
        {"text": "Coelho", "score": 2},
        {"text": "Cobra", "score": 3},
        {"text": "Elefante", "score": 6},
        {"text": "Leão", "score": 9},
      ],
    },
    {
      "text": "Qual o seu instrutor favorito?",
      "answers": [
        {"text": "Maria", "score": 5},
        {"text": "João", "score": 9},
        {"text": "Leo", "score": 10},
        {"text": "Pedro", "score": 6}
      ],
    }
  ];

  void _replay(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _scoreAll += score;
      });
    }
  }

  void _resetQuestions() {
    setState(() {
      _selectedQuestion = 0;
      _scoreAll = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: hasSelectedQuestion
            ? Questions(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                replay: _replay,
              )
            : Result(_scoreAll, _resetQuestions),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
