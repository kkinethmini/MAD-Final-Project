import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddminScreen extends StatefulWidget {
  const AddminScreen({super.key});

  @override
  State<AddminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AddminScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _deleteUser(String id) async {
    await _firestore.collection('users').doc(id).delete();
  }

  void _deleteCourse(String id) async {
    await _firestore.collection('courses').doc(id).delete();
  }

  void _addCourseDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Course"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _firestore.collection('courses').add({
                'title': titleController.text,
                'description': descriptionController.text,
                'createdAt': Timestamp.now(),
              });
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _editCourseDialog(DocumentSnapshot courseDoc) {
    final course = courseDoc.data() as Map<String, dynamic>;
    final titleController = TextEditingController(text: course['title']);
    final descriptionController = TextEditingController(text: course['description']);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Course"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _firestore.collection('courses').doc(courseDoc.id).update({
                'title': titleController.text,
                'description': descriptionController.text,
                'updatedAt': Timestamp.now(),
              });
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTile(DocumentSnapshot userDoc) {
    final user = userDoc.data() as Map<String, dynamic>;
    return ListTile(
      title: Text(user['username']),
      subtitle: Text(user['email']),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () => _deleteUser(userDoc.id),
      ),
    );
  }

  Widget _buildCourseTile(DocumentSnapshot courseDoc) {
    final course = courseDoc.data() as Map<String, dynamic>;
    return ListTile(
      title: Text(course['title']),
      subtitle: Text(course['description']),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () => _editCourseDialog(courseDoc),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _deleteCourse(courseDoc.id),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addCourseDialog,
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              labelColor: Colors.deepPurple,
              tabs: [
                Tab(text: "Users"),
                Tab(text: "Courses"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('users').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                      final docs = snapshot.data!.docs;
                      return ListView(children: docs.map(_buildUserTile).toList());
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('courses').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                      final docs = snapshot.data!.docs;
                      return ListView(children: docs.map(_buildCourseTile).toList());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
