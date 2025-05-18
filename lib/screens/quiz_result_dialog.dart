import 'package:flutter/material.dart';

void showQuizResultDialog({
  required BuildContext context,
  required int score,
  required int totalQuestions,
  required VoidCallback onPass,
  required VoidCallback onFail,
}) {
  final bool isPassed = score >= 6;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.red.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        isPassed ? 'Quiz Passed 🎉' : 'Quiz Failed 😞',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
        'You scored $score out of $totalQuestions.\n'
        '${isPassed ? 'Great! You may continue the course.' : 'Please try again to proceed.'}',
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: isPassed ? onPass : onFail,
          child: Text(isPassed ? 'Continue Course' : 'Retry Quiz'),
        ),
      ],
    ),
  );
}
