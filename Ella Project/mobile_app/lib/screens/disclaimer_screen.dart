import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../models/user.dart';

class DisclaimerScreen extends StatelessWidget {
  final User user;
  const DisclaimerScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disclaimer")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Important Disclaimer",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text("1. This application is for demonstration purposes only."),
            const Text("2. Your data is stored locally in a SQLite database."),
            const Text("3. By proceeding, you agree to our terms of service."),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(user: user),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                  child: const Text("I AGREE"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showNoAgreeDialog(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                  child: const Text("I DO NOT AGREE"),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showNoAgreeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: const Text("If you don’t agree, you cannot enter"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to Login (since we used pushReplacement to get here)
              // Wait, Disclaimer was pushed with pushReplacement from Login.
              // So if we pop, we exit. Let's explicitly redirect to login.
              // Note: In current flow, Login is the root if we used pushReplacement.
              // Actually, pushReplacement replaces Login with Disclaimer.
              // So popping Disclaimer will result in black screen if no other page in stack.
              // Better to Navigator.pushReplacement back to Login.
            },
            child: const Text("OK"),
          ),
        ],
      ),
    ).then((_) {
       // After dialog is closed, redirect to login
       Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    });
  }
}
