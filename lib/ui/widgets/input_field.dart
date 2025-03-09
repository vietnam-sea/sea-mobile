import 'package:flutter/material.dart';

enum InputFieldType { text, email, password, phone, number, search }

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final InputFieldType type;
  final bool filled;
  final Color? fillColor;
  final InputBorder border;
  final TextStyle? textStyle;
  final int? maxLength;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    this.hint = '',
    this.type = InputFieldType.text,
    this.filled = false,
    this.fillColor,
    this.border = const OutlineInputBorder(),
    this.textStyle,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.next,
  });

  @override
  InputFieldState createState() => InputFieldState(); // <== Make this public
}

class InputFieldState extends State<InputField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.type == InputFieldType.password;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      keyboardType: _getKeyboardType(widget.type),
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        border: widget.border,
        prefixIcon: _getPrefixIcon(widget.type),
        suffixIcon: widget.type == InputFieldType.password
            ? IconButton(
                icon:
                    Icon(isObscured ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => isObscured = !isObscured),
              )
            : null,
        filled: widget.filled,
        fillColor: widget.fillColor,
      ),
      style: widget.textStyle,
    );
  }

  TextInputType _getKeyboardType(InputFieldType type) {
    switch (type) {
      case InputFieldType.email:
        return TextInputType.emailAddress;
      case InputFieldType.phone:
        return TextInputType.phone;
      case InputFieldType.number:
        return TextInputType.number;
      case InputFieldType.search:
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }

  Icon? _getPrefixIcon(InputFieldType type) {
    switch (type) {
      case InputFieldType.email:
        return const Icon(Icons.email);
      case InputFieldType.password:
        return const Icon(Icons.lock);
      case InputFieldType.phone:
        return const Icon(Icons.phone);
      case InputFieldType.search:
        return const Icon(Icons.search);
      default:
        return null;
    }
  }
}
