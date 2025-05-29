import 'package:flutter/material.dart';

class CertificatePage extends StatelessWidget {
  final bool passedExam;

  const CertificatePage({Key? key, required this.passedExam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificate Viewer'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple.shade50,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Certificate of Completion',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'This certifies that',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      'Supun Avishka',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('has successfully completed the Python Course.'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Claim Certificate'),
                onPressed: passedExam
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Certificate Claimed!")),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                passedExam
                    ? 'You’ve passed the exam! 🎉'
                    : 'You must pass the exam to claim your certificate.',
                style: TextStyle(
                  color: passedExam ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
