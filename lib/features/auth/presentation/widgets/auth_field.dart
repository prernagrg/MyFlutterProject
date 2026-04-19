import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(27),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(72, 182, 179, 179),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(111, 161, 15, 134),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
