import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
    );
  }
}
