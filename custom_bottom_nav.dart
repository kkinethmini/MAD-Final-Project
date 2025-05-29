// Importing the Flutter Material package which contains the necessary widgets and themes
import 'package:flutter/material.dart';


// Defining a stateless widget named CustomBottomNav
class CustomBottomNav extends StatelessWidget {
// The currently selected index of the bottom navigation bar
  final int currentIndex;

// Callback function that will be triggered when an item is tapped
  final Function(int) onTap;

// Constructor for the CustomBottomNav widget with required parameters

  const CustomBottomNav({super.key, required this.currentIndex, required this.onTap});

// Passes the key to the superclass constructor

// Requires the current index to be passed

// Requires the onTap function to be passed



 // Overriding the build method to define the widget's UI

  @override

Widget build(BuildContext context) {
// Returning a BottomNavigationBar widget

    return BottomNavigationBar(
    
      currentIndex: currentIndex, // Sets the currently selected index
      onTap: onTap, // Sets the function to call when a navigation item is tapped
      selectedItemColor: Colors.deepPurple,// Color of the selected item
      unselectedItemColor: Colors.grey, // Color of the unselected items

      items: const [ // List of items in the BottomNavigationBar

        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        // Icon for the Home item label: 'Home', Label for the Home item

        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'My Courses'),
       // Icon for the My Courses item , Label for the My Courses item

       BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Progress'),
       // Icon for the Progress item ,  Label for the Progress item

       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
       // Icon for the Account item ,  Label for the Account item

      ],
    );
  }
}
