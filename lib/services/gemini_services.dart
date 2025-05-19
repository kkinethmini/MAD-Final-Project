import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  // You can use .env or a hardcoded key here
  // final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  final String _apiKey = 'AIzaSyAMa6RV0gfTTj1IHM0YMYyKz3xYagvmgx0'; // Replace with your real API key

  Future<String> generateText(String prompt) async {
    if (_apiKey.isEmpty) {
      return 'Error: API key not found';
    }

    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=$_apiKey'
        ,
    );

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ]
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['candidates'][0]['content']['parts'][0]['text'];
    } else {
      print('Gemini API error: ${response.body}');
      return 'Failed to generate response.';
    }
  }

  // Optional: list models your key can access
  Future<void> listModels() async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models?key=$_apiKey',
    );
    final response = await http.get(url);
    print('Available models: ${response.body}');
  }
}
