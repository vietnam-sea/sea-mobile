import 'package:flutter/material.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            // Email Field
            EmailField(controller: _emailController),

            SizedBox(height: 20),

            // Password Field
            PasswordField(controller: _passwordController),

            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                String email = _emailController.text;
                String password = _passwordController.text;
                print("Email: $email, Password: $password");
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width
                padding: EdgeInsets.symmetric(vertical: 14),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
