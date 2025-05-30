// Importing Flutter's material design library
import 'package:flutter/material.dart';

// Defining a stateless widget named CustomHeader
class CustomHeader extends StatelessWidget {
  // A final String variable to hold the header title
  final String title;

   // Constructor for the CustomHeader widget with a required title parameter
  const CustomHeader({super.key, required this.title});

  // Overriding the build method to define the widget's UI
  @override
  Widget build(BuildContext context) {
    return Container( 
        // Adding horizontal and vertical padding to the container
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Colors.deepPurple,// Setting the background color of the container to deep purple
      child: Row(
        children: [
          Text(
            title,  // Using the dynamic title passed to the widget

            style: const TextStyle(
              color: Colors.white, // White text color
              fontSize: 22, // Font size set to 22
              fontWeight: FontWeight.bold, // Bold text style
                        ),
          ),
        ],
      ),
    );
  }
}
