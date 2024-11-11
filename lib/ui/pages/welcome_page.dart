import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text('Go to Login'),
        ).p20(), // Padding utility
      ),
    );
  }
}
