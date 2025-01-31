import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
        returnToDashboard: true, // Set true jika ingin kembali ke Dashboard
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            const Text('Name: John Doe'),
            const Text('Status: Active User'),
            ElevatedButton(
              onPressed: () {
                // Navigate to Login Screen when logged out
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false, // Removes all previous routes
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Change to red to indicate logout
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text("Logout"),
            ),
          ],
          
        ),
      ),
    );
  }
}
