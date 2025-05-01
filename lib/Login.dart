import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "edex1",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false, // Disables default leading icon
          actions: [
            Builder(
              builder:
                  (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text("accountName"),
                accountEmail: Text("accountEmail"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(""),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: "User Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true, // <-- hide password
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
