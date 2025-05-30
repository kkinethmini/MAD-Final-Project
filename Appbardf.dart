// Importing Flutter's material design package
import 'package:flutter/material.dart';

 
// Defining a stateless widget called Appbardf that implements PreferredSizeWidget
class Appbardf extends StatelessWidget implements PreferredSizeWidget {

   // Constructor with an optional key parameter
  const Appbardf({super.key});

    // Overriding the build method to return the custom AppBar UI
  @override
  Widget build(BuildContext context) {
    return AppBar(
          // Title text displayed in the center of the AppBar
      title: const Text(
        "edex1",
        style: TextStyle(
          fontWeight: FontWeight.w500, // Sets medium weight for the font
          fontSize: 24,
          color: Colors.white, // Sets text color to white
        ),
      ),

           backgroundColor: Colors.green,  // Sets the background color of the AppBar
      automaticallyImplyLeading: false, // Disables default leading icon

           actions: [ // Widgets displayed at the right side of the AppBar

  
        Builder( // Using Builder to get the correct context for Scaffold
          builder:
                       (context) => IconButton( // IconButton widget to open drawer
                  icon: const Icon(Icons.menu),// Menu icon as the button
