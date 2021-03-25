import 'package:flutter/material.dart';
import './Question.dart';
import './Answer.dart';

class Questions extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) replay;

  Questions({
    @required this.questions,
    @required this.replay,
    @required this.selectedQuestion,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasSelectedQuestion ? questions[selectedQuestion]["answers"] : null;

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]["text"]),
        ...answers.map((resText) {
          return Answer(resText["text"], () => replay(resText["score"]));
        }).toList(),
      ],
    );
  }
}
