import 'package:black_hole/screens/CertificatePage.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_header.dart';

class LearningStatsPage extends StatefulWidget {
  const LearningStatsPage({Key? key}) : super(key: key);

  @override
  State<LearningStatsPage> createState() => _LearningStatsPageState();
}

class _LearningStatsPageState extends State<LearningStatsPage> {
  int _currentIndex = 2; // Assuming index 2 = Progress
  final List<String> _routes = ['/home', '/progress', '/courses', '/account'];

  void _onNavTapped(int index) {
    if (index != _currentIndex) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomHeader(title: 'Learning Status'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('📈 Course Current Status'),
                  _infoRow('Current Level', 'Intermediate'),
                  const SizedBox(height: 10),
                  _infoRow('Last Lesson', 'Loops in Python'),
                  const SizedBox(height: 10),
                  _progressBar('Python Course', 0.6),
                  const SizedBox(height: 10),
                  _infoRow('Total Study Hours', '42 hrs'),
                  const SizedBox(height: 20),
                  _sectionTitle('🏆 Achievements'),
                  _infoRow('Badges Earned', '5'),
                  _infoRow('Certificates', '2 (Downloadable)'),
                  const SizedBox(height: 20),
                  _sectionTitle('🔥 Study Streak'),
                  _infoRow('Current Streak', '5 days'),
                  _infoRow('Longest Streak', '12 days'),
                  const SizedBox(height: 20),
                  _sectionTitle('📚 Course Info'),
                  _infoRow('Enrolled Courses', 'Python Basics, OOP in Python'),
                  _infoRow('Completed Lessons', '18'),
                  _infoRow('Quizzes Attempted', '6'),
                  _infoRow('Average Quiz Score', '87%'),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Download Certificates'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CertificatePage(
                              passedExam: true), // or false if not passed
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNav(currentIndex: _currentIndex, onTap: _onNavTapped),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  Widget _infoRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );

  Widget _progressBar(String title, double progress) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
          ),
          const SizedBox(height: 5),
          Text('${(progress * 100).toStringAsFixed(0)}% Completed'),
        ],
      );
}
