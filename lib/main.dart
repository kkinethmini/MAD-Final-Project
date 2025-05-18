import 'package:black_hole/screens/CertificatePage.dart';
import 'package:black_hole/screens/ChatWithAIPage.dart';
import 'package:black_hole/screens/NewCoursesPage.dart';
import 'package:black_hole/screens/QuizPage.dart';
import 'package:black_hole/screens/account_page.dart';
import 'package:black_hole/screens/my_courses_page.dart';
import 'package:black_hole/screens/progress_page.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Show login if no user is logged in, otherwise go to home
      //  initialRoute:
      // FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      title: 'Solo Learning',
      theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomePage(),
        '/progress': (_) => MyCoursesPage(),
        '/courses': (_) => const LearningStatsPage(),
        '/account': (_) => const ProfilePage(),
        '/quiz': (_) => const QuizPage(),
        '/new_courses': (context) => NewCoursesPage(),
        '/chat_ai': (context) => ChatWithAIPage(),
        '/certificate': (context) => const CertificatePage(passedExam: true),
      },
    );
  }
}
