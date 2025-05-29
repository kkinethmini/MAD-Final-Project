// Import the dart:convert library to encode and decode JSON data
import 'dart:convert';
// Import the http package for making HTTP requests
import 'package:http/http.dart' as http;
// Import the flutter_dotenv package for loading environment variables
import 'package:flutter_dotenv/flutter_dotenv.dart';


// Define a class GeminiService to handle Gemini API interaction
class GeminiService {
  // You can use .env or a hardcoded key here
  // final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  final String _apiKey = 'AIzaSyAMa6RV0gfTTj1IHM0YMYyKz3xYagvmgx0'; // Replace with your real API key

   // Function to generate text using the Gemini API
  Future<String> generateText(String prompt) async {
    // Check if API key is empty
    if (_apiKey.isEmpty) {
      return 'Error: API key not found'; // Return error message if no API key
    }
    
    // Define the endpoint URL with the API key
final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=$_apiKey'
        ,
    );

     // Set headers for the HTTP request
    final headers = {
      'Content-Type': 'application/json',
    };
 // Define the request body in JSON format
    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": prompt}  // Include the prompt text in the request
          ]
        }
      ]
    });

    // Make an HTTP POST request to the Gemini API
    final response = await http.post(url, headers: headers, body: body);
    
// Check if the request was successful
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body); // Decode the response body
      return json['candidates'][0]['content']['parts'][0]['text']; // Return the generated text

    } else {
       // Print the error response and return a failure message
      print('Gemini API error: ${response.body}');
      return 'Failed to generate response.';
    }
  }

  // Optional: list models your key can access
  Future<void> listModels() async {
    // Define the endpoint URL for listing models
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models?key=$_apiKey',
    );
     // Make an HTTP GET request to the endpoint
    final response = await http.get(url);
     // Print the list of available models
    print('Available models: ${response.body}');
  }
}
    
