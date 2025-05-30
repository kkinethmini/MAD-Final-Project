import 'package:flutter/material.dart';
void showQuizResultDialog({
 required BuildContext context,
  required int score,
  required int totalQuestions,
  required VoidCallback onPass,
  required VoidCallback onFail,
})
