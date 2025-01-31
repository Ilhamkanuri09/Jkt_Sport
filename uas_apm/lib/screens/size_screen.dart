import 'package:flutter/material.dart';

class SizeScreen extends StatelessWidget {
  const SizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Guide'),
        backgroundColor: Colors.blue[900],
      ),
      body: const Center(
        child: Text('Size Information will go here.'),
      ),
    );
  }
}
