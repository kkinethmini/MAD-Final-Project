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