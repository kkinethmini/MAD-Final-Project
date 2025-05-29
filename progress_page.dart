import 'package:black_hole/screens/CourseDetailPage.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_header.dart';

/// Main widget for displaying user's courses
class MyCoursesPage extends StatelessWidget {
  // List of enrolled courses with details
  final List<Map<String, dynamic>> enrolledCourses = [
    {
      'title': 'Python Basics',
      'level': 'Beginner',
      'progress': 0.6,
    },
    {
      'title': 'OOP in Python',
      'level': 'Intermediate',
      'progress': 0.3,
    },
    {
      'title': 'Python for Data Analysis',
      'level': 'Advanced',
      'progress': 0.1,
    },
  ];

   // List of completed course titles
  final List<String> completedCourses = [
    'File Handling in Python',
    'Exception Handling'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Main content column
      body: Column(
        children: [
          const CustomHeader(title: 'My Courses'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title for enrolled courses
                  const Text('Enrolled Courses',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  
                  // Render a CourseCard widget for each enrolled course
                  ...enrolledCourses
                      .map((course) => CourseCard(course: course)),
                  const SizedBox(height: 40),

                  // Section title for completed courses
                  const Text('Completed Courses',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  
                  // Render list tiles for completed courses with a certificate button

                  ...completedCourses.map((course) => ListTile(
                      leading:
                          const Icon(Icons.check_circle, color: Colors.green),
                      title: Text(course),
                      trailing: TextButton(
                        onPressed: () {
                          // Navigate to certificate page
                          Navigator.pushNamed(context, '/certificate');
                        },
                        child: const Text(
                          'Certificate',
                          style: TextStyle(color: Colors.amber),
                        ),
                      ))),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Custom bottom navigation bar
      bottomNavigationBar: CustomBottomNav(
          currentIndex: 1,
          onTap: (index) {
             // Navigate to selected bottom navigation screen
            Navigator.pushReplacementNamed(
                context, ['/home', '/progress', '/courses', '/account'][index]);
          }),
    );
  }
}
class CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course title and level badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(course['title'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(course['level'],
                      style: const TextStyle(fontSize: 12)),
                )
              ],
            ),
            const SizedBox(height: 12),
             // Progress bar
            LinearProgressIndicator(
              value: course['progress'],
              backgroundColor: Colors.grey.shade300,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 12),
             // Continue button navigates to course detail page
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            CourseDetailPage(title: course['title'])),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
