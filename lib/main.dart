import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/account_page.dart';
import 'screens/my_courses_page.dart';
import 'screens/progress_page.dart';
import 'screens/QuizPage.dart';
import 'screens/NewCoursesPage.dart';
import 'screens/ChatWithAIPage.dart';
import 'screens/CertificatePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await dotenv.load(fileName: ".env"); // Load environment variables
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solo Learning',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/' : '/home',
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
