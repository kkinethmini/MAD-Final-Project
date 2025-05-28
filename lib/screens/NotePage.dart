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