import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
