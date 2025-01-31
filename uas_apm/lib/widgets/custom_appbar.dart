import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool returnToDashboard;

  const CustomAppBar({
    super.key,
    required this.title,
    this.returnToDashboard = false, // Default ke halaman sebelumnya
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.blue[900],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (returnToDashboard) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (route) => false,
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
