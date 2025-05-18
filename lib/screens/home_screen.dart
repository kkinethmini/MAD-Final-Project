import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
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
          const CustomHeader(title: 'Home'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hello, Supun Avishka 👋',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple)),
                  const SizedBox(height: 8),
                  const Text('"Every day is a chance to learn something new!"'),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _quickAccessTile(Icons.play_circle_fill, 'Continue Learning', '/progress'),
                      _quickAccessTile(Icons.new_releases, 'Start New Course', '/new_courses'),
                      _quickAccessTile(Icons.smart_toy, 'Chat with AI', '/chat_ai'),
                      _quickAccessTile(Icons.quiz, 'Take a Quiz', '/quiz'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _dailyStreakWidget(),
                  const SizedBox(height: 24),
                  const Text('Featured Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _courseCard('Python Hero Course', 'Master'),
                        _courseCard('OOP in Python', 'Trending'),
                        _courseCard('Data Science', 'New'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Reminders & Updates', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _reminderCard('Complete Python OOP quiz by 7 PM'),
                  _reminderCard('New course released: Web Dev with Flask'),
                  const SizedBox(height: 24),
                  const Text('Explore Topics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _topicChip('OOP'),
                      _topicChip('Data Structures'),
                      _topicChip('Flask'),
                      _topicChip('Pandas'),
                      _topicChip('Functions'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Tip of the Day', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('"Use list comprehensions for cleaner and faster loops in Python."'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTapped,
      ),
    );
  }

  Widget _quickAccessTile(IconData icon, String title, String routeName) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.deepPurple),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget _dailyStreakWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.local_fire_department, color: Colors.orange),
          SizedBox(width: 8),
          Text('🔥 3-day streak! Keep it going!')
        ],
      ),
    );
  }

  Widget _courseCard(String title, String tag) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tag, style: const TextStyle(fontSize: 12, color: Colors.white70)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _reminderCard(String message) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.notifications_active, color: Colors.deepPurple),
        title: Text(message),
      ),
    );
  }

  Widget _topicChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.deepPurple.shade50,
    );
  }
}
