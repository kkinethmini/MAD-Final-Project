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

  void nextQuestion() {
    if (selectedOption == -1) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Answer Question First")));
      return;
    }

    if (selectedOption == questions[currentQuestion]['answer']) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedOption = -1;
      });
    } else {
      // Show result dialog
      showQuizResultDialog(
        context: context,
        score: score,
        totalQuestions: questions.length,
        onPass: () {
          Navigator.pop(context); // close dialog
          Navigator.pushReplacementNamed(context, '/courses');
        },
        onFail: () {
          Navigator.pop(context); // close dialog
          setState(() {
            currentQuestion = 0;
            selectedOption = -1;
            score = 0;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomHeader(title: 'Python Quiz'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Q${currentQuestion + 1} of ${questions.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  question['question'],
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 24),
                ...List.generate(question['options'].length, (index) {
                  final isSelected = selectedOption == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.deepPurple.shade100
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? Colors.deepPurple
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: isSelected ? Colors.deepPurple : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              question['options'][index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedOption = -1;
                          if (currentQuestion < questions.length - 1) {
                            currentQuestion++;
                          }
                        });
                      },
                      child: const Text("Skip"),
                    ),
                    ElevatedButton(
                      onPressed: nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Next →',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacementNamed(
            context,
            ['/home', '/progress', '/courses', '/account'][index],
          );
        },
      ),
    );
  }
}
