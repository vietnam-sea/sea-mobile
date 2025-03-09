import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sea_mobile/ui/widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    print("Name: $name, Email: $email, Password: $password");
  }

  void _signInWithGoogle() {
    print("Google Sign-In triggered");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Sign Up".text.xl4.bold.blue900.make().pOnly(bottom: 20),
              InputField(
                controller: _nameController,
                label: "Full Name",
                hint: "Enter your name",
                type: InputFieldType.text,
              ).pOnly(bottom: 15),
              InputField(
                controller: _emailController,
                label: "Email",
                hint: "Enter your email",
                type: InputFieldType.email,
              ).pOnly(bottom: 15),
              InputField(
                controller: _passwordController,
                label: "Password",
                hint: "Enter your password",
                type: InputFieldType.password,
              ).pOnly(bottom: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: "Register".text.lg.make(),
              ).pOnly(bottom: 15),
              OutlinedButton.icon(
                onPressed: _signInWithGoogle,
                icon: const Icon(FontAwesomeIcons.google,
                    color: Colors.blue, size: 20),
                label: "Sign in with Google".text.blue900.make(),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ).pOnly(bottom: 15),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child:
                    "Already have an account? Login".text.blue900.bold.make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
