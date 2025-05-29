import 'package:flutter/material.dart';

class NewCoursesPage extends StatelessWidget {
  final List<String> courses = [
    'Intro to Python Programming',
    'Python for Beginners',
    'Advanced Python Techniques',
    'Python with Flask',
    'Data Analysis with Python',
    'Python for Web Development',
    'Python in Machine Learning',
    'Python Scripting Essentials',
    'Automate with Python',
    'Python for Data Visualization',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Python Courses'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(courses[index]),
              trailing: ElevatedButton(
                onPressed: () {
                  // Add your navigation logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text('Start' ,style: TextStyle(color: Colors.amber),),
              ),
            ),
          );
        },
      ),
    );
  }
}
