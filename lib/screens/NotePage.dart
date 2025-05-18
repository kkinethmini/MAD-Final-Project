import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_header.dart';

class NotePage extends StatelessWidget {
  final String subtopicTitle;

  const NotePage({required this.subtopicTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomHeader(title: subtopicTitle),
          Padding(
  padding: const EdgeInsets.only(left: 16.0, top: 10),
  child: Align(
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.arrow_back, color: Colors.deepPurple),
            SizedBox(width: 8),
            Text(
              "Back to Courses",
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),

          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is a placeholder note for the selected subtopic.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 1, onTap: (index) {
        Navigator.pushReplacementNamed(context, ['/home', '/progress', '/courses', '/account'][index]);
      }),
    );
  }
}
