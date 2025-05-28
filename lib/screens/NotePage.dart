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