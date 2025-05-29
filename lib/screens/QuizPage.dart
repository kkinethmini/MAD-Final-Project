import 'package:black_hole/screens/quiz_result_dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_header.dart';
import '../widgets/custom_bottom_nav.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int selectedOption = -1;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of print(2**3)?',
      'options': ['6', '8', '9', 'Error'],
      'answer': 1,
    },
    {
      'question': 'Which keyword is used for function in Python?',
      'options': ['func', 'define', 'def', 'function'],
      'answer': 2,
    },
    {
      'question': 'What is the correct file extension for Python files?',
      'options': ['.py', '.up', '.pyt', '.tsx'],
      'answer': 0,
    },
    {
      'question': 'What is the output of print(2 + 3 * 4)?',
      'options': ['20', '14', '24', '28'],
      'answer': 1,
    },
    {
      'question': 'What type of data does the input() function return?',
      'options': ['Integer', 'Float', 'Boolean', 'String'],
      'answer': 3,
    },
    {
      'question': 'Which of these is a valid variable name in Python?',
      'options': ['2value', '_value', 'value-name', 'value name'],
      'answer': 1,
    },
    {
      'question': 'How do you insert COMMENTS in Python code?',
      'options': [
        '/* comment */',
        '// comment',
        '# comment',
        '<!-- comment -->',
      ],
      'answer': 2,
    },
    {
      'question': 'Which operator is used for multiplication?',
      'options': ['x', '*', '%', '^'],
      'answer': 1,
    },
    {
      'question': 'What is the output of print(type("5"))?',
      'options': ['int', 'float', 'str', 'bool'],
      'answer': 2,
    },
    {
      'question': 'Which of these is used to create a list in Python?',
      'options': ['()', '{}', '<>', '[]'],
      'answer': 3,
    },
  ];