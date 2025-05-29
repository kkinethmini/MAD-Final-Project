import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class q1 extends StatefulWidget {
  const q1({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<q1> {
  String? _selectedAnswer;
  bool _isLoading = false;

  Future<void> _submitAnswer() async {
    if (_selectedAnswer == null) return;

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://your-api-url.com/submit-answer');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'question': 'What is the capital of France?',
        'answer': _selectedAnswer,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Answer submitted successfully!')),
      );

      Navigator.pushNamed(context, '/q2');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Submission failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This sends the user to the previous page
          },
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('What is the capital of France?'),
          ListTile(
            title: const Text('Paris'),
            leading: Radio<String>(
              value: 'Paris',
              groupValue: _selectedAnswer,
              onChanged: (value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('London'),
            leading: Radio<String>(
              value: 'London',
              groupValue: _selectedAnswer,
              onChanged: (value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: _isLoading ? null : _submitAnswer,

            child:
                _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Submit'),
          ),
        ],
      ),
    );
  }
}