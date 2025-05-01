import 'package:black_hole/Home.dart' as home_screen;
import 'package:black_hole/Login.dart' as login_screen;
import 'package:black_hole/Signup.dart' as signup_screen;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_screen.Home(),
      routes: {
        '/login':
            (context) =>
                login_screen.Home(), // if Login.dart also has Home widget
        '/signup': (context) => signup_screen.Signup(),
      },
    );
  }
}
