import 'package:black_hole/Appbardf.dart';
import 'package:black_hole/Drewer.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const Appbardf(),
        drawer: const Drewer(),
        body: Center(child: Text("signup")),
      ),
    );
  }
}
