import 'package:black_hole/screens/CourseDetailPage.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_header.dart';

class MyCoursesPage extends StatelessWidget {
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

  final List<String> completedCourses = [
    'File Handling in Python',
    'Exception Handling'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomHeader(title: 'My Courses'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enrolled Courses',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  ...enrolledCourses
                      .map((course) => CourseCard(course: course)),
                  const SizedBox(height: 40),
                  const Text('Completed Courses',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...completedCourses.map((course) => ListTile(
                      leading:
                          const Icon(Icons.check_circle, color: Colors.green),
                      title: Text(course),
                      trailing: TextButton(
                        onPressed: () {
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
      bottomNavigationBar: CustomBottomNav(
          currentIndex: 1,
          onTap: (index) {
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
            LinearProgressIndicator(
              value: course['progress'],
              backgroundColor: Colors.grey.shade300,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 12),
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
