import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  PasswordField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true, // Hide password
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
