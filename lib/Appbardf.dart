import 'package:flutter/material.dart';

class Appbardf extends StatelessWidget implements PreferredSizeWidget {
  const Appbardf({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
