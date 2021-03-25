import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  final void Function() whenResetQuestions;

  Result(this.score, this.whenResetQuestions);

  String get textResult {
    if (score < 8) {
      return "Parabéns!";
    } else if (score < 12) {
      return "Você é bom!";
    } else if (score < 16) {
      return "Impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textResult,
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
          ),
        ),
        FlatButton(
          child: Text(
            "Reiniciar?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          textColor: Colors.blue,
          onPressed: whenResetQuestions,
        )
      ],
    );
  }
}
