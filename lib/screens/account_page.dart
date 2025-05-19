import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;
  final List<String> _routes = ['/home', '/progress', '/courses', '/account'];

  String? _userName;
  String? _email;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          _userName = doc['username'] ?? user.displayName ?? 'User';
          _email = user.email ?? 'Not available';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _userName = 'User';
        _email = 'Unavailable';
        _isLoading = false;
      });
      print('Error fetching user data: $e');
    }
  }

  void _onNavTapped(int index) {
    if (index != _currentIndex) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  bool isDarkMode = false;
  String language = 'English';

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void _changeLanguage(String? newLang) {
    if (newLang != null) {
      setState(() {
        language = newLang;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomHeader(title: 'Account'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/avatar_placeholder.png'),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.edit, color: Colors.deepPurple),
                          onPressed: () {
                            // Handle image change
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username: $_userName',
                                style: const TextStyle(fontSize: 16)),
                            Text('Email: $_email',
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                  const Divider(height: 40),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Edit Profile'),
                    onTap: () {
                      // Navigate to edit profile page
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: isDarkMode,
                    onChanged: _toggleTheme,
                    secondary: const Icon(Icons.brightness_6),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    trailing: DropdownButton<String>(
                      value: language,
                      onChanged: _changeLanguage,
                      items: const [
                        DropdownMenuItem(
                            value: 'English', child: Text('English')),
                        DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
                        DropdownMenuItem(
                            value: 'Spanish', child: Text('Spanish')),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notification Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.alarm),
                    title: const Text('Learning Reminders'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.support_agent),
                    title: const Text('App Feedback & Support'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
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
}
